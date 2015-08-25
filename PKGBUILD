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
sha256sums=('9a117c38ca3eddd3bc80d14a2bdfcb9afe9a0777de533fa845bbd2b4bc2cd0b5')

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
