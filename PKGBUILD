# Maintainer: satcom886 <rostik.medved@gmail.com>

pkgname=vc4clstdlib-git
pkgver=1
pkgrel=2
pkgdesc="VC4CL implementation of the OpenCL standard-library and is required to build the VC4C compiler"
arch=('any')
url="https://github.com/doe300/VC4CLStdLib"
license=('MIT')
groups=()
depends=()
makedepends=('wget' 'make')
optdepends=()
provides=('vc4clstdlib' 'vc4-libraries')
source=("https://github.com/doe300/VC4CLStdLib/archive/master.tar.gz")
md5sums=('SKIP')

build() {
	mkdir -p $srcdir/VC4CLStdLib-master/build
	cd $srcdir/VC4CLStdLib-master/build
	cmake "$srcdir/VC4CLStdLib-master"
	make
}

package() {
	cd $srcdir/VC4CLStdLib-master/build
	make DESTDIR="$pkgdir"/ install
}
