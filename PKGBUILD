# Maintainer: Jasper Smit <jrhrsmit@gmail.com>

pkgname=tce
pkgver=1.21
pkgrel=1
pkgdesc="TTA-Based Co-Design Environment (TCE) - Open ASIP tools http://openasip.org"
arch=("x86_64")
url="https://github.com/cpc/tce"
license=('MIT')
makedepends=('git' 'cmake' 'make' 'latex2html' 'autoconf' 'automake')
depends=('llvm-tce' 'llvm-tce-libs' 'wxgtk2' 'boost' 'boost-libs' 'tcl' 'libedit' 'sqlite' 'xerces-c'
        'gcc' 'libffi'  'libtool')
source=("${pkgname}-${pkgver}::git+${url}.git#branch=release-${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd ${pkgname}-${pkgver}/tce
    ./autogen.sh  
    ./configure --prefix=/usr
}

build() {
    cd ${pkgname}-${pkgver}/tce
    make
}

package() {
    cd ${pkgname}-${pkgver}/tce
	make DESTDIR="$pkgdir/" install
}

