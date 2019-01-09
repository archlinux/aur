# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=wastesedge
pkgver=0.3.8
pkgrel=2
pkgdesc="Open source role playing game based on Adonthell engine"
arch=('any')
url="http://adonthell.nongnu.org/"
license=('GPL2')
depends=('adonthell' 'hicolor-icon-theme' 'desktop-file-utils')
source=(http://savannah.nongnu.org/download/adonthell/$pkgname-src-$pkgver.tar.gz)
sha256sums=('744aa03c727d01d8242ad8f9688175baac7712676f966b34b8e3914e891d06ca')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
