# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zoraxy-bin
pkgver=3.3.5
pkgrel=1
pkgdesc='A general purpose HTTP reverse proxy and forwarding tool. Now written in Go!'
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
sha256sums_aarch64=('8d5056081880fc1432ef9679d1d4bff6146cdad77a7908d1f9304a528fffff0b')
sha256sums_armv7h=('1ab89f378881919c3ae35c715d92e2cccb96b5f08c4e445cf8702e0388d6ac37')
sha256sums_i686=('babcd9423f6878f76e16edf299d9664c2f7e11ed8a35e4a8485d3408fdf0cb88')
sha256sums_x86_64=('41b066f6f521a7b991af87dbdda41f6c5dae9708015f77e3d0db95787ec0f24e')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
}
