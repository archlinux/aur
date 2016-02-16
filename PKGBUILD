# Maintainer: Samuel Damashek <samuel dot damashek at gmail dot com>
pkgname=huggle
_gitver=7f116e7af68430cfbe0222809c7aaa5f1d3b59c9
pkgver=3.1.20.g${_gitver:0:7}
pkgrel=1
pkgdesc="diff browser intended for dealing with vandalism and other unconstructive edits on Wikimedia projects"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL')
depends=('qt5-base' 'qt5-webkit')
makedepends=('cmake' 'unzip')
groups=('base-devel')
source=("https://github.com/huggle/huggle3-qt-lx/archive/${_gitver}.tar.gz")
md5sums=('ebf49ef1004d2d1448710cbd0db6d460')


prepare() {
    cd "$srcdir/huggle3-qt-lx-${_gitver}/huggle"

    pushd libs
    unzip libirc.zip
}

build() {
    cd "$srcdir/huggle3-qt-lx-${_gitver}/huggle"

    cmake . -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
    cd "$srcdir/huggle3-qt-lx-${_gitver}/huggle"
    make DESTDIR=$pkgdir install
}
