# Maintainer: Drew DeVault <sir@cmpwn.com>

pkgname=scmake
pkgver=0.1
pkgrel=2
license=('MIT')
pkgdesc="A simple build system"
arch=('any')
url='https://github.com/SirCmpwn/scmake'
source=("https://github.com/SirCmpwn/scmake/archive/${pkgver}.tar.gz")
sha1sums=('37ec1376117de55a268202ab0caaac9969cfc208')

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
