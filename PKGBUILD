# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lariza
pkgver=21.06
pkgrel=1
pkgdesc="Simple WebKit2GTK+ Browser"
arch=('i686' 'x86_64')
url="https://www.uninformativ.de/git/lariza"
license=('custom:MIT')
depends=('webkit2gtk')
source=("$url/archives/$pkgname-v$pkgver.tar.gz")
sha256sums=('9faf06a8f4d87b3a63eb3c1e22dcbc7d8361c054357637ae7e870b9212372a13')

build() {
  cd $pkgname-v$pkgver
  make
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" prefix="/usr" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
