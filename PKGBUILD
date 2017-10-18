# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lariza
pkgver=17.10
pkgrel=1
pkgdesc="Simple WebKit2GTK+ Browser"
arch=('i686' 'x86_64')
url="https://www.uninformativ.de/projects/lariza/"
license=('custom:PIZZA-WARE')
depends=('webkit2gtk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vain/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('0354f287429f92742dfb223b34f6d86a54e000f9754f7695aa23c61cfd14d44ccc97b70387da68d1f29eef2d6c11430ebae075f80b4abf681063cefcd973e3fb')

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
