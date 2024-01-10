# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=monophony
pkgver=2.5.2
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
sha256sums=('b4f10d6381d27363686d655d605c2e5bea525b3065ba0d767e0d89e76db24ddd')

build() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	make
}

package() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	make install prefix="$pkgdir/usr"
}
