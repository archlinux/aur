# Maintainer: Samuel Damashek <samuel dot damashek at gmail dot com>
pkgname=huggle
pkgver=3.1.19
pkgrel=2
pkgdesc="diff browser intended for dealing with vandalism and other unconstructive edits on Wikimedia projects"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL')
depends=('qt5-base' 'qt5-webkit')
makedepends=('cmake' 'unzip')
groups=('base-devel')
source=("https://github.com/huggle/huggle3-qt-lx/archive/${pkgver}.tar.gz")
md5sums=('c938cdcde4b6e7b928c6670371d368c9')

prepare() {
    cd "$srcdir/huggle3-qt-lx-$pkgver"

    pushd libs

    unzip libirc.zip
}

build() {
    cd "$srcdir/huggle3-qt-lx-$pkgver/huggle"

    cmake . -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
    cd "$srcdir/huggle3-qt-lx-$pkgver/huggle"
    make DESTDIR=$pkgdir install
}
