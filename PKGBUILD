# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Falk Höppner <falk hoppner se>

pkgname=qbittorrent-vuetorrent-bin
_pkgname=vuetorrent
pkgver=2.28.2
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
sha512sums=('c8c4b9a57e2b7e7fa9482204230e78d92a7a400a8baabe929ba983ef418eb34f43b8618cf18d72bae7807c672e28171e7d8aaac22b19d162a77842b3dbf1da67')

package() {
	cd "$srcdir/vuetorrent"
	find . -type f -exec install -D '{}' "$pkgdir/usr/share/$pkgname/{}" ';'
}
# vim:set ts=2 sw=2 et:
