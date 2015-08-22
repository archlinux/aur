pkgname=tcllauncher
pkgver=1.5
pkgrel=1
pkgdesc="A launcher for Tcl applications"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/flightaware/tcllauncher"
license=('BSD')
provides=('tcllauncher')
source=(https://github.com/flightaware/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('7cae6fa8e257d76fd4f122842898c7e8')
depends=('tcl')
makedepends=('git' 'autoconf')
changelog=($pkgname.changelog)

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

