# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=libfilezilla
pkgname=$_pkgname-svn
pkgver=7250
pkgrel=1
pkgdesc="C++ library, offering some basic functionality to build high-performing, platform-independent programs"
arch=("i686" "x86_64")
url="https://lib.filezilla-project.org"
license=("GPL")
makedepends=("subversion" "doxygen")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::svn+https://svn.filezilla-project.org/svn/libfilezilla/trunk")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    svnversion
}

build() {
    cd $_pkgname
    autoreconf -i
    ./configure --prefix=/usr
    make
}

package() {
    cd $_pkgname
    make DESTDIR=$pkgdir install
}
