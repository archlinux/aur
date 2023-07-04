# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=monophony
pkgver=1.9.0
pkgrel=1
pkgdesc="Linux app for streaming music from YouTube."
arch=('x86_64')
url="https://gitlab.com/zehkira/monophony"
license=('MIT')
groups=()
depends=(
	'libadwaita'
	'python-gobject'
	'python-mpris_server'
	'python-ordered-set'
	'python-requests'
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
sha256sums=('490d653b074fdf42b066469928511028180a3079e11344f122deb657944130a8')

build() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	make
}

package() {
	cd "$srcdir/$pkgname-v$pkgver/source"

	make install prefix="$pkgdir/usr"
}
