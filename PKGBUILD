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
source=("https://github.com/BertoldVdb/$pkgname/archive/master.zip")
md5sums=('347e223869f61d3314b1ecf979bf8d36') #autofill using updpkgsums

build() {
cd $srcdir/$pkgname-master/
  make
}

package() {
  install -D -m644 $srcdir/$pkgname-master/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 $srcdir/$pkgname-master/$pkgname "${pkgdir}/usr/bin/${pkgname}"  
}
