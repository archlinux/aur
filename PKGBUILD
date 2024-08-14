# Maintainer: BreakTheMyth <pinks302@163.com>
pkgname=xcursor-medium5
pkgver=1.0
pkgrel=1
pkgdesc="Cursor for X11"
arch=('any')
url="https://github.com/BreakTheMyth/xcursor-medium5/"
license=('custom')
makedepends=('tar' 'gzip')
install=$pkgname.install
source=("https://github.com/BreakTheMyth/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname.install")
sha256sums=('SKIP'
	'SKIP')

prepare() {
	cd "$srcdir"
	tar -zxvf "v$pkgver.tar.gz"
}

package() {
	install -d "$pkgdir/usr/share/icons/$pkgname"
	install -d "$pkgdir/usr/share/icons/defalut"
	cp -r "$srcdir/$pkgname-$pkgver/cursors/" "$pkgdir/usr/share/icons/$pkgname"
	install -Dm644 "$srcdir/$pkgname-$pkgver/index.theme" "$pkgdir/usr/share/icons/$pkgname"
}


