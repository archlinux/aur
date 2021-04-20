# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lariza
pkgver=21.01
pkgrel=2
pkgdesc="Simple WebKit2GTK+ Browser"
arch=('i686' 'x86_64')
url="https://www.uninformativ.de/git/lariza"
license=('custom:MIT')
depends=('webkit2gtk')
source=("$url/archives/$pkgname-v$pkgver.tar.gz")
sha256sums=('0e98b5b381bd0af6a259b641e832bf13d1d0aecf987a588ff3618380a1390e99')

build() {
  cd $pkgname-v$pkgver
  make
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" prefix="/usr" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
