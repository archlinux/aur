# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=monophony
pkgver=2.5.0
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
sha256sums=('43a7a5d0e7788f3e4033f0ffb9d5072d79239601a3850ccb66edd10aca7e70ae')

build() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	make
}

package() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	make install prefix="$pkgdir/usr"
}
