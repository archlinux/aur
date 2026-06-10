# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zoraxy-bin
pkgver=3.3.3
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
sha256sums_aarch64=('d004e188d7af356ff6f30bb1ee0da18ce65dab352189cabe827a564de0ba374f')
sha256sums_armv7h=('cdc01ca289b229952925d0229fa0260a7b91e5db3afe680110f8709c2ea85e08')
sha256sums_i686=('6b4bc6ffb84bd580bcd2de8227b110ccd5bc4d5e5dc226194d339fc216bdf46e')
sha256sums_x86_64=('c78f03e18503c1d7344fd4e2ebed0dd12686994c0c5188d6eeb939a5573f7a39')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
