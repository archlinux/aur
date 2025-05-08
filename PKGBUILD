# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Radoslaw Mejer <radmen@radmen.info>
_pkgname=jd
pkgname="${_pkgname}-tool-bin"
pkgver=2.2.3
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
sha256sums_aarch64=('0e9c8469f4aa63a3bf3f441380372ef4d8b11b608664fccc22aeac7097a31171')
sha256sums_x86_64=('f602ff38b06811002777f34600b5abf68f38d8e4007dcfc451816f017daf84d2')
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}