# Maintainer: Ales Katona <almindor@gmail.com>
pkgname=etherwall
pkgver=0.9.2
pkgrel=1
pkgdesc="Ethereum GUI Wallet (QT5)"
arch=(i686 x86_64)
url="http://etherwall.com"
license=('GPL3')
depends=('qt5-declarative')
source=("https://github.com/almindor/${pkgname}/archive/release/${pkgver}.tar.gz")
md5sums=('5ad267cb940886bd524decc9c4dc0a56')

build() {
  cd "$pkgname-release-$pkgver"

  qmake -config release && make
}

package() {
  cd "$pkgname-release-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  cp ./Etherwall "$pkgdir/usr/bin/etherwall"
}
