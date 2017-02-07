# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: Ameysh <trader9@gmail.com>
pkgname=ta-lib
pkgver=0.4.0
pkgrel=3
pkgdesc="A library providing common functions for the technical analysis of financial market data."
url="http://ta-lib.org/"
license=('bsd')
arch=('x86_64' 'i686')
depends=(bash)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=("http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz")
md5sums=('308e53b9644213fc29262f36b9d3d9b9')

build() {
  cd $srcdir/$pkgname

  ./configure --prefix=/usr LDFLAGS="-lm"
  make
}

package() {
  cd $srcdir/$pkgname

  make -j1 DESTDIR=$pkgdir install
}
