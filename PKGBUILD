# Maintainer: Marcel Schneider <marcel@coopmasters.de>
pkgname=csv2xls
pkgver=0.4.1
pkgrel=1
pkgdesc="a command line utility which converts csv files into one (or more if splitted) Excel(TM) files."
arch=('i686' 'x86_64')
url="https://github.com/ferkulat/csv2xls"
license=('GPL')
groups=()
depends=()
makedepends=(cmake)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=( git+https://github.com/ferkulat/csv2xls.git)
md5sums=('SKIP')
noextract=()

build() {
  cd "$srcdir/$pkgname"
  git checkout v$pkgver
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  cmake --build .
}

package() {
  cd "$srcdir/$pkgname/build"

  make DESTDIR="$pkgdir/" install
  rm -rf $pkgdir/usr/include
  rm -rf $pkgdir/usr/lib
}


