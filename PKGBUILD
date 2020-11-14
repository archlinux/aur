# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=wattsi
pkgver=r126.7f2fb37
pkgrel=1
pkgdesc="Preprocessor for the HTML Standard"
arch=('x86_64')
url="https://github.com/whatwg/wattsi"
license=('custom')
makedepends=(fpc)
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname/"
	make
}

package() {
	cd "$srcdir/$pkgname/"
	install -Dm755 -t "$pkgdir/usr/bin/" bin/wattsi
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md Syntax.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
