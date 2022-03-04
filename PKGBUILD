# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=octetos-math
pkgver=0.23.0
pkgrel=1
phase=alpha
pkgdesc="C++ Library math"
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/octetos-math.git"
depends=('octetos-core')
md5sums=('28e0cda52e8ab53286311ac0ebd41f47')
source=(https://github.com/azaeldevel/$pkgname/archive/${pkgver}-$phase.tar.gz)

build() {
    cd $pkgname-$pkgver-$phase
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
  cd $pkgname-$pkgver-$phase
  make DESTDIR="${pkgdir}" install
}
