# Maintainer: Joe Neeman <joeneeman@gmail.com>
# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>
# Contributor: Alessandro "jakedust" Andrioni <jakedust@gmail.com>
pkgname=mpir
pkgver=2.7.2
pkgrel=1
pkgdesc="Library for multiple precision integers and rationals"
arch=('i686' 'x86_64')
url="http://www.mpir.org/"
license=('LGPL')
depends=('gcc-libs')
source=(http://www.mpir.org/mpir-$pkgver.tar.lz)
md5sums=('2d47419dac50cc4a89c8c23421e66db1')
install=mpir.install

build() {
  cd "$srcdir/mpir-$pkgver"
  [[ "$CARCH" == "i686" ]] && export ABI=32
  ./configure --prefix=/usr --enable-cxx 
  make
}

check() {
  cd "$srcdir/mpir-$pkgver"
  make check
}

package() {
  cd "$srcdir/mpir-$pkgver"
  make DESTDIR="$pkgdir" install
}

