# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=monophony
pkgver=2.8.0
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
sha256sums=('4ae469aaba5aa561aaa83a8d50a0c28ff694b03846dc2b73df955ef1d94d7adc')

build() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	make
}

package() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	make install prefix="$pkgdir/usr"
}
