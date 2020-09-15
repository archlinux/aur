# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=lordsawar
pkgver=0.3.2
pkgrel=1
pkgdesc="Turn-based strategy game for controling of as many cities as possible"
arch=('x86_64')
url="http://www.nongnu.org/lordsawar/"
license=("GPL")
depends=('libxslt' 'gtkmm3' 'libarchive' 'gstreamermm' 'libxml++2.6')
makedepends=('intltool')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ee9f8f2f0e07595ae5fbdb6259bfbc1fb9c88d17eeda723c8e23428a0bcda7b1')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr 
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
