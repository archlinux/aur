# Maintainer: Manuel Conzelmann
pkgname=sdtool
pkgver=1.0
pkgrel=1
pkgdesc="set hardware lock/unlock on (micro) sd cards"
arch=('i686' 'x86_64')
url="http://www.bertold.org/sdtool/"
license=('custom')
depends=()
makedepends=()
source=("http://www.bertold.org/sdtool/$pkgname-HEAD.tar.gz" 'Makefile.patch')
md5sums=('2ae6307d8584ee56a96615da3ad4edbd' '6a3ffb20d32f9b1f9b451a344f48c740') #autofill using updpkgsums

build() {
  patch -p0 < $startdir/Makefile.patch
  make
}

package() {
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 $srcdir/$pkgname "${pkgdir}/usr/bin/${pkgname}"  
}
