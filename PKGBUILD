# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lariza
pkgver=20.08
pkgrel=1
pkgdesc="Simple WebKit2GTK+ Browser"
arch=('i686' 'x86_64')
url="https://www.uninformativ.de/git/lariza"
license=('custom:PIZZA-WARE')
depends=('webkit2gtk')
makedepends=('git')
optdepends=('tabbed')
source=("$pkgname-uninformative::git+$url.git#commit=58cfea62b5ea721df1498cfaa329f88dcb7fd20d")
sha512sums=('SKIP')

build() {
  cd $pkgname-uninformative
  make
}

package() {
  cd $pkgname-uninformative
  make DESTDIR="$pkgdir" prefix="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
