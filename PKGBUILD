# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-math
pkgver=0.12.0
pkgrel=1
pkgdesc="C++ Library math"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-math.git"
depends=('octetos-core')
md5sums=('6775d2bbf043453725f3d58ef540c956')
source=(https://github.com/azaeldevel/octetos-math/archive/${pkgver}-alpha.tar.gz)

build() {
    cd $pkgname-$pkgver-alpha
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd $pkgname-$pkgver-alpha
  make DESTDIR="${pkgdir}" install
}
