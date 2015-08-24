# Maintainer: Dan Schaper <dschaper at ganymeade dot com>

pkgname=tcllauncher
pkgver=1.5
pkgrel=2
pkgdesc="A launcher for Tcl applications"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url=('https://github.com/flightaware/tcllauncher')
license=('BSD')
source=("${pkgname}.tar.gz::https://github.com/flightaware/$pkgname/archive/v$pkgver.tar.gz")
sha1sums=('665b316094161eb649e2318a221e098323588177')
depends=('tcl')
changelog=("$pkgname.changelog")

prepare(){
  cd $pkgname-$pkgver
  autoconf
  ./configure
}

build() {
  cd $pkgname-$pkgver 
  make
}

package()
{
  cd $pkgname-$pkgver
  make install DESTDIR=${pkgdir}
  install -Dm644 license.terms ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}

