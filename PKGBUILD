# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=libint2
_pkgname=libint
pkgver=2.6.0
pkgrel=1
pkgdesc='A library for the evaluation of molecular integrals of many-body operators over Gaussian functions'
url='https://github.com/evaleev/libint'
license=('GPL3')
arch=('x86_64')
depends=('boost' 'boost-libs' 'gmp')
makedepends=('make' 'autoconf' 'doxygen' 'clang' 'texlive-bin')
source=("https://github.com/evaleev/libint/archive/v${pkgver}.tar.gz")
sha1sums=('2432391ff400bb9bf813443043582fa397f38b0a')
options=(!strip)

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}

    ./autogen.sh
    
    mkdir build
    cd build

    ../configure --prefix=/usr
    make
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/build

    make DESTDIR="$pkgdir" install
}
