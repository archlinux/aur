# Contributor: Drew DeVault <sir@cmpwn.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=scmake
pkgver=0.2
pkgrel=1
license=('MIT')
pkgdesc="A simple build system"
arch=('any')
url='https://github.com/SirCmpwn/scmake'
source=("$pkgname-$pkgver.tar.gz::https://github.com/SirCmpwn/scmake/archive/${pkgver}.tar.gz")
sha256sums=('7401aa2c42a992218c32c55a629d8ee17185fb22514b120b03851d63ffcb3ab4')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="$pkgdir/usr/" make install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE 
}
