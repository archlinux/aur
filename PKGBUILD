# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lariza
pkgver=17.02
pkgrel=1
pkgdesc="Simple WebKit2GTK+ Browser"
arch=('i686' 'x86_64')
url="https://www.uninformativ.de/projects/lariza/"
license=('custom:PIZZA-WARE')
depends=('webkit2gtk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vain/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('729232a06bb1d197f1dfb6addbd4bf92b7cf99cc07a1b9debf8675f9c16c0692fe05e29152d19daabea190eecc84ff31b6985d7fa174b4dbece10888f35651e1')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" prefix="/usr" install
  install -Dm644 we_adblock.so \
    "$pkgdir"/usr/lib/$pkgname/web_extensions/we_adblock.so
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
