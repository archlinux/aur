# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Falk Höppner <falk hoppner se>

pkgname=qbittorrent-vuetorrent-bin
_pkgname=vuetorrent
pkgver=2.7.1
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

source=("${_pkgname}-$pkgver.zip::${url}/releases/download/v$pkgver/${_pkgname}.zip")
sha512sums=('0aa53eb66ee384f514d555f40d686c946479057baef98860cc76d6d48a84d42f312eb107c8d69286c4816983926d2ba37cd977bf56acce974257e4b344568c20')

package() {
	cd "$srcdir/vuetorrent"
	find . -type f -exec install -D '{}' "$pkgdir/usr/share/$pkgname/{}" ';'
}
# vim:set ts=2 sw=2 et:
