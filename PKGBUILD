# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=bicep-bin
pkgver=0.25.3
pkgrel=1
pkgdesc='A declarative language for describing and deploying Azure resources'
arch=(
  "aarch64"
  "x86_64"
)
url='https://github.com/Azure/bicep'
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
  'glibc'
  'zlib'
)
options=("!strip")
source=(
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/Azure/bicep/v${pkgver}/LICENSE"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64")
sha256sums=('c2cfccb812fe482101a8f04597dfc5a9991a6b2748266c47ac91b6a5aae15383')
sha256sums_aarch64=('3fd7e5955c6ef83c63f28bf2199ddc674beb4292be0a9d0ddc081af5003585c1')
sha256sums_x86_64=('cf809e4c72781de9cb0faaa33e539a27b8bce4e849cfdf35f86788b46f888031')
package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}