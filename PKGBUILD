# Maintainer:  Peter Mattern <pmattern at arcor dot de>

pkgname=libfilezilla
pkgver=0.3.0
pkgrel=1
pkgdesc="C++ library, offering some basic functionality to build high-performing, platform-independent programs"
arch=("i686" "x86_64")
url="https://lib.filezilla-project.org"
license=("GPL")
makedepends=("subversion" "doxygen")
source=("https://downloads.sourceforge.net/sourceforge/filezilla/${pkgname}-${pkgver}.tar.bz2")
sha256sums=("1ca09836fc166f21cedb71a45e5efc0771650a74d9f611d1fe320f36b53fa42d")

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR=$pkgdir install
}
