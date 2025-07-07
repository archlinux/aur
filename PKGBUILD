# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=bicep-bin
pkgver=0.36.177
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
sha256sums_aarch64=('98790c2ada26b99d6792f3e146cee7d0a7de6cda3d30937e9aaa6f81446d6cf7')
sha256sums_x86_64=('a861e75a76c892ea181e05a423ade793cddd2ddba6b6ceaf64a92349a11517d4')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
