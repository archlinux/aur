# Maintainer: Alastair Stuart <alastair@muto.so>

pkgname=cvsps2
pkgver=2.1
pkgrel=1
pkgdesc="cvsps v2, needed by 'git cvsimport'"
url="http://www.cobite.com/cvsps/"
license=('GPL')
provides=('cvsps')
arch=('i686' 'x86_64')
source=("http://www.cobite.com/cvsps/cvsps-${pkgver}.tar.gz"
        "inet_addr-64bit.patch")
md5sums=('bde2110ed9f5d14de8f8cb04e9d596fe'
         '669d2eefca07ef46cafbe3686d616239')

build() {
  patch -p0 -i $srcdir/inet_addr-64bit.patch
  cd "$srcdir/cvsps-$pkgver"
  make prefix=/usr
}

package() {
  cd "$srcdir/cvsps-$pkgver"
  make prefix="$pkgdir/usr" install
}
