# maintainer : fenugrec
# contributors : xantares,  icarus 
pkgname=freediag
pkgver=1.09
pkgrel=1
pkgdesc="OBD-II vehicle diagnostic software and (mostly) J1978 compliant scan tool."
arch=('i686' 'x86_64')
url="http://freediag.sourceforge.net/"
license=('GPL')
makedepends=('cmake')
depends=('glibc')
optdepends=('readline: better CLI')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/1.0/$pkgname-$pkgver-src.tar.gz")
sha256sums=('23a12f417303361aebc08e931a9543d041169ba329b4c5569765de7a93de9bbc')

build() {
  cd "$pkgname-$pkgver-src"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_RCFILE=ON -DUSE_INIFILE=ON
  make
}


package () {
  cd "$pkgname-$pkgver-src"
  make DESTDIR="$pkgdir" install
}

