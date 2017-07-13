# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lariza
pkgver=17.07
pkgrel=1
pkgdesc="Simple WebKit2GTK+ Browser"
arch=('i686' 'x86_64')
url="https://www.uninformativ.de/projects/lariza/"
license=('custom:PIZZA-WARE')
depends=('webkit2gtk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vain/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('83084d83039ed2e96f5f12022c1840380d1293c3c7427ceb23448b59372da771d9dbfc6eb67771dfb154d5320309fda0dfa255791baaf286a7490def6328aea3')

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
