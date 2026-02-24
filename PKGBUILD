# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Radoslaw Mejer <radmen@radmen.info>
_pkgname=jd
pkgname="${_pkgname}-tool-bin"
pkgver=2.5.0
pkgrel=1
pkgdesc="JSON diff and patch.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/josephburnett/jd"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/josephburnett/jd/v${pkgver}/LICENSE")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-arm64-linux")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-amd64-linux")
sha256sums=('7db445fe94ae6fb0c5ab69a6b47ec38a0e4b6d5a38f9d1493c0d8cb7c8ad2516')
sha256sums_aarch64=('3c45a7b95a0fa7e0fd0dbeb65e02a40ba46078d9b27129b3455b8f7f650d3a80')
sha256sums_x86_64=('785dbbb8af613269539de952f7444f66f7cfbeb886c037495c4f0b2c3680db27')
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
