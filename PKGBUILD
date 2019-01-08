# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=wastesedge
pkgver=0.3.8
pkgrel=1
pkgdesc="Open source role playing game based on Adonthell engine"
arch=('any')
url="http://adonthell.nongnu.org/"
license=('GPL2')
depends=('adonthell' 'hicolor-icon-theme' 'desktop-file-utils')
source=(http://savannah.nongnu.org/download/adonthell/$pkgname-src-$pkgver.tar.gz)
sha256sums=('2003ef56f9673216a97d2aa277465c4cd6ff5f8be81e703508eb4425c556b620')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
