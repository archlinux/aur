# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=superderpy-git
pkgver=v0.1a.70.g30bb72b
pkgrel=1
pkgdesc="A My Little Pony themed arcade game with famous Derpy Hooves as main hero. Development version."
arch=('i686' 'x86_64')
url='http://superderpy.com/'
license=('GPL2+')
conflicts=('superderpy')
provides=('superderpy')
depends=('allegro')
makedepends=('cmake')
source=(git://github.com/dos1/SuperDerpy)
sha256sums=('SKIP')

pkgver() {
  cd SuperDerpy
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  mkdir -p "SuperDerpy/build"
  cd "SuperDerpy/build"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"  -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "SuperDerpy/build"
  make install
}
