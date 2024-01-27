# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='google-font-download'
pkgver='1.4.3'
pkgrel='1'
pkgdesc='Google Fonts web font downloader'
arch=('any')
url="https://github.com/neverpanic/$pkgname"
license=('BSD-2-Clause')
depends=('curl' 'ncurses')
checkdepends=('xxd')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('977a9746d2c5ec7dbcb81cb401c5497bb169dac8d2fdd088b82c8de435e5e1a80fe76fea44e98c4ce093aa6a9401ec4f687372f706d246d08705ebc7325e634a')

_sourcedirectory="$pkgname-$pkgver"

check() {
	cd "$srcdir/$_sourcedirectory/"
	make syntax-check
	make test
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/BSD-2-Clause"
}
