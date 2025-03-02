# Maintainer: Bascht <aur at bascht dot com>
_pkgname=alpinezen
pkgname=${_pkgname}-bin
pkgver="1.0.0"
pkgrel=1
pkgdesc='Breathe life into your workspace with dynamic wallpapers'
license=('GPL-3.0-or-later')
arch=('x86_64' 'arm64')
url="https://github.com/TilmanGriesel/${_pkgname}"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}.service")
#license=("${pkgname}-${pkgver}.tar.gz::https://github.com/TilmanGriesel/AlpineZen/archive/v${pkgver}.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-wallpaper-linux-amd64-${pkgver}.tar.gz")
source_arm64=("${url}/releases/download/v${pkgver}/${_pkgname}-wallpaper-linux-arm64-${pkgver}.tar.gz")
sha256sums=('741451fb03c6db48ef874a050a1f181db5e12849e63cac1b6abe1183db91b2ee')
sha256sums_x86_64=('b3349c5122a056025d116a9caa82185db91ac3b17675fc0f6fe7a2ee30811c4b')
sha256sums_arm64=('03bead4b1f874fd6beb5cd4b6026f00bdd62835115dcfc186d838895dd221a35')

package() {
    install -Dm755 "${_pkgname}"-wallpaper-cli-linux-* "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}
