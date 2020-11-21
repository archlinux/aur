# Maintainer: relrel <relrelbachar@gmail.com>
_pkgname=wattsi
pkgname=$_pkgname-git
pkgver=r126.7f2fb37
pkgrel=1
pkgdesc="Preprocessor for the HTML Standard"
arch=('x86_64')
url="https://github.com/whatwg/$_pkgname"
license=('custom')
makedepends=(fpc)
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname/"
	make
}

package() {
	cd "$srcdir/$_pkgname/"
	install -Dm755 -t "$pkgdir/usr/bin/" "bin/$_pkgname"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md Syntax.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
