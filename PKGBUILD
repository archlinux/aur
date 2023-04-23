# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Falk Höppner <falk hoppner se>

pkgname=qbittorrent-vuetorrent-bin
_pkgname=vuetorrent
pkgver=1.5.4
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
sha512sums=('28a1b36b46658a2b6b479b3f36710060d951a772e21cad934dbc5bba8b4c78b63364af4c3cb34fe59c8105c741890ece4fbb30534f414f58d69c4522fc04e902')

package() {
    cd "$srcdir/vuetorrent"
    find . -type f -exec install -D '{}' "$pkgdir/usr/share/$pkgname/{}" ';'
}
# vim:set ts=2 sw=2 et:
