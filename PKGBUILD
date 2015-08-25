# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=ticklemonster
pkgver=0.1.2
pkgrel=1
pkgdesc="You're the TICKLE MONSTER! You tickle kids to ensure they are raised with proper amounts of fun! Game made for Ludum Dare 33"
arch=('i686' 'x86_64')
url='http://dosowisko.net/ticklemonster/'
license=('GPL2+')
depends=('allegro')
makedepends=('cmake')
source=(http://dosowisko.net/ticklemonster/TickleMonster-$pkgver-Linux.tar.gz)
sha256sums=('190e598b271545d2a8d66890b8925f6fad727bcd7624258aac9c9cd3c2a7a691')

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
