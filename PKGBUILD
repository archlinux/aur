# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=bicep-bin
pkgver=0.31.92
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
    'dotnet-runtime>=8.0.0'
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
sha256sums_aarch64=('36857a90b45ed59e2ed25b837dab7d552005000f3670f040cb950545f74ea71e')
sha256sums_x86_64=('4ba96f90e767fc606f23bbbf60cf07ef3557665cc70b893172193edd86685815')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
