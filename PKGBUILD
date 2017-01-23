# Maintainer: Alexander Oleynichenko <alexvoleynichenko@gmail.com>
pkgname=libint2
pkgver='2.3.0'
pkgrel=1
epoch=
pkgdesc="A high-performance library for evaluation of molecular integrals of many-body operators over Gaussian functions"
arch=('i686' 'x86_64')
url="https://github.com/evaleev/libint"
license=('GPL')
groups=()
depends=()
makedepends=(gcc automake autoconf)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/evaleev/libint/archive/master.zip")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
    cd "$srcdir/libint-master"
    ./autogen.sh
    mkdir build
    cd build
    ../configure --prefix=/usr
    make -j8
}

check() {
    cd "$srcdir/libint-master/build"
#   You may uncomment 'make check' line if you want;
#   however, check is a VERY time-consuming and actually not needed
#	make -k check
}

package() {
	cd "$srcdir/libint-master/build"
	make DESTDIR="$pkgdir/" install
}
