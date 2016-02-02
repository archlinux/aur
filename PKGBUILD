# Maintainer:  Peter Mattern <pmattern at arcor dot de>

pkgname=libfilezilla
pkgver=0.3.1
pkgrel=2
pkgdesc='C++ library, offering some basic functionality to build high-performing, platform-independent programs'
arch=('i686' 'x86_64')
url='https://lib.filezilla-project.org'
license=('GPL')
makedepends=('doxygen')
source=("https://downloads.sourceforge.net/sourceforge/filezilla/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('a4adde9ce2de975e0f8b111705b9f89939466f19edf609efb785a6bf00f050ef')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR=$pkgdir install
}
