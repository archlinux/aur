# Maintainer: Samuel Damashek <samuel dot damashek at gmail dot com>
pkgname=huggle
pkgver=3.1.18
pkgrel=2
pkgdesc="Huggle Anti-Vandalism tool for Wikipedia"
arch=('i686' 'x86_64')
url="https://en.wikipedia.org/wiki/Wikipedia:Huggle"
license=('GPL')
makedepends=('qconf' 'cmake' 'qtwebkit' 'qt4')
groups=('base-devel')
source=("https://github.com/huggle/huggle3-qt-lx/archive/${pkgver}.tar.gz")
md5sums=('33dc2147cee192e1209d0ca1e81dcf3d')

build() {
    cd "$srcdir/huggle3-qt-lx-$pkgver/huggle"

    cmake . -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
    cd "$srcdir/huggle3-qt-lx-$pkgver/huggle"
    make DESTDIR=$pkgdir install
}
