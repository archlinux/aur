# Maintainer: This package is no longer developed <nobody@anonymous.invalid>
pkgname=morris-worm
pkgver=1.0.0
pkgrel=1
pkgdesc="The Morris worm was one of the first computer worms distributed via the Internet"
arch=('any')
license=('unknown')
depends=()
source=("git+https://github.com/arialdomartini/morris-worm.git"
        "no-static.patch")
md5sums=("SKIP"
	"SKIP")

prepare() {
	cd "$pkgname"
	patch -p1 -i "$srcdir/no-static.patch"
}

build() {
	cd "$pkgname"
	make
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/$pkgname/test $pkgdir/usr/bin/morris-worm
}
