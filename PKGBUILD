# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lariza
pkgver=17.11
pkgrel=1
pkgdesc="Simple WebKit2GTK+ Browser"
arch=('i686' 'x86_64')
url="https://www.uninformativ.de/projects/lariza/"
license=('custom:PIZZA-WARE')
depends=('webkit2gtk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vain/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('ae683db771be24afdedd9ecef8a234dd028e08cd8e8f610eb7e4174c6f9631424e723b0c59dbc88ab34e29c3b0851441d6a7e3e1b62b988a469f3be48775e5e9')

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
