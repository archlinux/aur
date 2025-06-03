# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=bicep-bin
pkgver=0.36.1
pkgrel=1
pkgdesc="A declarative language for describing and deploying Azure resources(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url='https://github.com/Azure/bicep'
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'glibc>=2.16'
    'gcc-libs'
    'dotnet-runtime>=8.0'
)
options=(
    '!strip'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Azure/bicep/v${pkgver}/LICENSE"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64")
sha256sums=('c2cfccb812fe482101a8f04597dfc5a9991a6b2748266c47ac91b6a5aae15383')
sha256sums_aarch64=('1cfc988006ca0ba31d737839d3c09c7b52a885efad3b3d7aeea26bb1a47bf27a')
sha256sums_x86_64=('db96c7082e0f964eb5a743dd67683c9325352e85ec209daeab955b6851014dd8')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
