# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Falk Höppner <falk hoppner se>

pkgname=qbittorrent-vuetorrent-bin
_pkgname=vuetorrent
pkgver=2.7.0
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
sha512sums=('bc4636fb3c5ece0f022a3b2aa2f638aa2aa94db26ac370a87004a54392fe5679be2d19c8a3087895ac8c26a67b10197e6aa17dd232dcc5bff3eabf9fdd6a6ef5')

package() {
	cd "$srcdir/vuetorrent"
	find . -type f -exec install -D '{}' "$pkgdir/usr/share/$pkgname/{}" ';'
}
# vim:set ts=2 sw=2 et:
