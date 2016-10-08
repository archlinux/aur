# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=lordsawar
pkgver=0.3.1
pkgrel=1
pkgdesc="Turn-based strategy game for controling of as many cities as possible"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/lordsawar/"
license=("GPL")
depends=('libxslt' 'glibmm' 'gtkmm3' 'libxml++' 'libarchive' 'libsigc++' 'gstreamer0.10-mm')
makedepends=('intltool')
source=(http://download.savannah.gnu.org/releases-noredirect/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d7fd7bdfa417e545fdbe772175ddcddd')

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
