# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Falk Höppner <falk hoppner se>

pkgname=qbittorrent-vuetorrent-bin
_pkgname=vuetorrent
pkgver=1.5.12
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
sha512sums=('a36b3b07854e7a69fbf5b81db993baefbde9fa766ba3c7b98e829585988b8a547f66e36fdfd3db14f9494cb5d52284481d21c49021387ded0d024fcf6d7f6e11')

package() {
    cd "$srcdir/vuetorrent"
    find . -type f -exec install -D '{}' "$pkgdir/usr/share/$pkgname/{}" ';'
}
# vim:set ts=2 sw=2 et:
