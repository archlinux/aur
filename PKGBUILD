# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Falk Höppner <falk hoppner se>

pkgname=qbittorrent-vuetorrent-bin
_pkgname=vuetorrent
pkgver=2.17.0
pkgrel=1

pkgdesc='The sleekest looking WebUI for qBittorrent made with Vue.js!'
arch=('any')
url='https://github.com/VueTorrent/VueTorrent'
license=('GPL3')

provides=("qbittorrent-${_pkgname}")
conflicts=("qbittorrent-${_pkgname}")
optdepends=(
	'qbittorrent: for use with qbittorrent'
	'qbittorrent-nox: for use with qbittorrent-nox'
)
install=qbittorrent-vuetorrent.install

source=("${_pkgname}-$pkgver.zip::${url}/releases/download/v$pkgver/${_pkgname}.zip")
sha512sums=('c2608f8451d1944cb386358b870e79aff6e24c4bb134e1677d0824002f5d8c1d118499b0f1f1b57a2d98a8f77d70518be5812a4c6be81debb1a324b12f4366e9')

package() {
	cd "$srcdir/vuetorrent"
	find . -type f -exec install -D '{}' "$pkgdir/usr/share/$pkgname/{}" ';'
}
# vim:set ts=2 sw=2 et:
