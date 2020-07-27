# Maintainer: Tomasz Cebula <tomaszc@o2.pl>
pkgname=fgx-qt5
pkgver=2.15.20
pkgrel=1
pkgdesc="Cross platform launcher for FlightGear, based on Qt5"
arch=('x86_64' 'i686')
url="http://fgx.freeflightsim.org/"
license=('GPL')
depends=('qt5-base' 'qt5-webkit' 'qt5-xmlpatterns')
makedepends=('binutils' 'coreutils')
conflicts=('fgx' 'fgx-git')
replaces=('fgx' 'fgx-git')
provides=('fgx')
source=('git+https://github.com/fgx/fgx.git#branch=next5')
sha512sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
    cd build
    cmake ../fgx \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd "$srcdir"/build
    make DESTDIR="$pkgdir" install
}
