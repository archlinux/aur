# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='google-font-download'
pkgver='1.4.2'
pkgrel='3'
pkgdesc='Google Fonts web font downloader'
arch=('any')
url="https://github.com/neverpanic/$pkgname"
license=('BSD')
depends=('curl' 'ncurses')
checkdepends=('vim')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7779cc4cbad7504c823c7db5a07a48f7e7b553ee82b1f1d8c88237f1b95336dc')

_sourcedirectory="$pkgname-$pkgver"

check() {
	cd "$srcdir/$_sourcedirectory/"
	make syntax-check
	make test
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
