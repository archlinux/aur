# Contributor: Vain <aurmaint1 on host: uninformativ dot de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lariza
pkgver=20.01
pkgrel=1
pkgdesc="Simple WebKit2GTK+ Browser"
arch=('i686' 'x86_64')
url="https://www.uninformativ.de/projects/lariza/"
license=('custom:PIZZA-WARE')
depends=('webkit2gtk')
makedepends=('git')
optdepends=('tabbed')
source=("git+https://www.uninformativ.de/git/lariza.git#commit=96055b0c4d9018e7e64a7f3826350e9db1e4e9d7")
sha512sums=('SKIP')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" prefix="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
