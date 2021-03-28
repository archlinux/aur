# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lariza
pkgver=21.01
pkgrel=1
pkgdesc="Simple WebKit2GTK+ Browser"
arch=('i686' 'x86_64')
url="https://www.uninformativ.de/git/lariza"
license=('custom:PIZZA-WARE')
depends=('webkit2gtk')
optdepends=('tabbed')
source=("https://www.uninformativ.de/git/$pkgname/archives/$pkgname-v$pkgver.tar.gz")
sha512sums=('0f7d3a0ed35fe2bdbdc54eaccc8e5bb2aa944ea52bd49110c6a7f1ab8131c9c93836d7c820f7568b6991a24e3a63ae76e6b9683bfed214ed9ee22bdabe814d52')

build() {
  cd $pkgname-v$pkgver
  make
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" prefix="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
