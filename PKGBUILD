# Maintainer: Rob Knegjens <rknegjens@gmail.com>
pkgname=qcl
pkgver=0.6.4
pkgrel=1
pkgdesc='Quantum Computation Language'
arch=('i686' 'x86_64')
url="http://tph.tuwien.ac.at/~oemer/qcl.html"
license=('GPL2')
depends=('flex' 'bison' 'readline' 'ncurses' 'plotutils')
source=("http://tph.tuwien.ac.at/~oemer/tgz/qcl-0.6.4.tgz" "makefile.patch")
md5sums=('a440b8b4441ba31f7d66ca76b4894a38'
         '632c461469fd01012d4bc1cb7c3924b6')

prepare() {
	cd "$srcdir/qcl-$pkgver"
    patch -Np1 -i "$srcdir/makefile.patch"
}

build() {
	cd "$srcdir/qcl-$pkgver"
	make
}

package() {
	cd "$srcdir/qcl-$pkgver"
	make DESTDIR="$pkgdir/" install
}
