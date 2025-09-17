# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zoraxy-bin
pkgver=3.2.6
pkgrel=1
pkgdesc='A general purpose HTTP reverse proxy and forwarding tool. Now written in Go!(Precompiled version)'
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://zoraxy.aroz.org/"
_ghurl="https://github.com/tobychui/zoraxy"
license=('AGPL-3.0-only')
depends=()
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}.service")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm")
source_i686=("${pkgname%-bin}-${pkgver}-i686::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_386")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64")
sha256sums=('1f93b8f03e2e1e368f67663e98730818e6e01e7a603ffd3b66872caf32e2b696')
sha256sums_aarch64=('e19609b2a707e96956a556b13e33ab3f720432cce10f4894e17ae94dca2447df')
sha256sums_armv7h=('1194c3627e7aaba5ff4aecf01809d4652d573075e1fde5a28a2aa2b64a25455c')
sha256sums_i686=('4e2e5ef1acbb6efcc33ad0535ae1b3df6aa6791d2ff9e654650ec25a48e5ae95')
sha256sums_x86_64=('38708e18e7051394ad20a2ce9f26655d15b18bd7435f6254812f12c1b40ddd22')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
