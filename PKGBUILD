# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Falk Höppner <falk hoppner se>

pkgname=qbittorrent-vuetorrent-bin
_pkgname=vuetorrent
pkgver=2.11.0
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
sha512sums=('8b6c7c03b6f7c45d19b58ef0a89fdd584e1f1dc9ff39f8f00eee973e419c2edfa9dcec677444534d642fa20c9af1af7b04af1be0fd975eb68e4ef404cd9ea625')

package() {
	cd "$srcdir/vuetorrent"
	find . -type f -exec install -D '{}' "$pkgdir/usr/share/$pkgname/{}" ';'
}
# vim:set ts=2 sw=2 et:
