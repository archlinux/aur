# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Falk Höppner <falk hoppner se>

pkgname=qbittorrent-vuetorrent-bin
_pkgname=vuetorrent
pkgver=2.1.0
pkgrel=1
pkgdesc='The sleekest looking WebUI for qBittorrent made with Vue.js!'
arch=('any')
url='https://github.com/WDaan/VueTorrent'
license=('GPL3')
provides=("qbittorrent-${_pkgname}")
conflicts=("qbittorrent-${_pkgname}")
optdepends=(
    'qbittorrent: for use with qbittorrent'
    'qbittorrent-nox: for use with qbittorrent-nox'
)
install=qbittorrent-vuetorrent.install
source=("${_pkgname}-$pkgver.zip::https://github.com/WDaan/VueTorrent/releases/download/v$pkgver/${_pkgname}.zip")
sha512sums=('dbe48ccca8e2ed3789a5ba57bac48d840b2d94a4144e6e2068271c0bbdc4b485c2ea2da45dc7b9594c3c746222aa9b9c7ccb0e121da53db29e6440100c6ec112')

package() {
    cd "$srcdir/vuetorrent"
    find . -type f -exec install -D '{}' "$pkgdir/usr/share/$pkgname/{}" ';'
}
# vim:set ts=2 sw=2 et:
