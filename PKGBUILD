# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=monophony
pkgver=2.2.2
pkgrel=1
pkgdesc="Linux app for streaming music from YouTube."
arch=('x86_64')
url="https://gitlab.com/zehkira/monophony"
license=('MIT')
groups=()
depends=(
	'libadwaita'
	'python-brotli'
	'python-gobject'
	'python-mpris_server'
	'python-mutagen'
	'python-ordered-set'
	'python-pycryptodomex'
	'python-requests'
	'python-websockets'
	'python-ytmusicapi'
	'yt-dlp'
)
makedepends=('nuitka')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('e7854746caf791b3bf3a33917e69f1853600805b821a88f4f8b3ecac38f2b4af')

build() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	make
}

package() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	make install prefix="$pkgdir/usr"
}
