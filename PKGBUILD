# Maintainer: Carlchristian Eckert <carli-eckert at gmx dot de>

pkgname=pngwriter-git
pkgver=0.5.4.r111.g131d72f
pkgrel=1
pkgdesc="A C++ library for creating PNG images"
url="http://pngwriter.sourceforge.net/"
source=("${pkgname}::git://github.com/pngwriter/pngwriter.git")
install=$pkgname.install
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('git')
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd $pkgname
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd $pkgname
    make DESTDIR="${pkgdir}" install
}
