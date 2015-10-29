# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=mediator
pkgver=0.1.2
pkgrel=1
pkgdesc="Save the world by being a mediator ensuring that no conflict gets escalated."
arch=('i686' 'x86_64')
url='http://dosowisko.net/mediator/'
license=('GPL2+')
depends=('allegro')
makedepends=('cmake')
source=(http://dosowisko.net/mediator/mediator-$pkgver-Linux.tar.gz)
sha256sums=('35cf6cdb1e52f1f0e06d21eefbb86ffb303d8b4451b2e23de6c7e21f98c1e5e3')

build() {
  mkdir "$pkgname/build"
  cd "$pkgname/build"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"  -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$pkgname/build"
  make install
}
