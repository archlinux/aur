# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=lariza
pkgver=16.06
pkgrel=1
pkgdesc="Simple WebKit2GTK+ Browser"
arch=('i686' 'x86_64')
url="https://www.uninformativ.de/projects/lariza/"
license=('custom:PIZZA-WARE')
depends=('webkit2gtk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vain/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('ba8966149d14c3ddad28f7030f78ed06')

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
