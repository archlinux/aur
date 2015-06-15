# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>
pkgname=radioedit
pkgver=0.1.3
pkgrel=1
pkgdesc="A simple game where you fight evil record label representatives who want to radio edit your amazing single."
arch=('i686' 'x86_64')
url='http://dosowisko.net/radioedit/'
license=('GPL2+')
depends=('allegro')
makedepends=('cmake')
source=(http://dosowisko.net/radioedit/RadioEdit-$pkgver-Linux.tar.gz)
sha256sums=('911669d707de7fa35682f5f2118322edfcd03e56d46e6c5236a668c6866bda8a')

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
