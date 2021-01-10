# Maintainer: Sebastian Frohn

pkgname=('kangaru' )
pkgver=4.2.4+12+g4852a2e
pkgrel=1
pkgdesc="An inversion of control container for C++11, C++14 and later"
arch=('x86_64')
url="https://github.com/gracicot/$pkgname"
license=('MIT')
depends=()
makedepends=('git' 'cmake' )
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^[r|v]//;s/-/+/g'
}

build() {
  cd "$pkgname"

  mkdir -p build && cd build

  cmake ..
}


package() {
  cd "$srcdir/$pkgname/build"

 make DESTDIR=$pkgdir install
}
