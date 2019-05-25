# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=libxc
pkgver=4.3.4
pkgrel=2
pkgdesc="library of exchange-correlation functionals for density-functional theory"
arch=('i686' 'x86_64')
url="http://www.tddft.org/programs/octopus/wiki/index.php/Libxc"
license=('MPL2')
makedepends=('gcc' 'gcc-fortran')
optdepends=()
source=(http://www.tddft.org/programs/octopus/down.php?file=libxc/$pkgver/libxc-$pkgver.tar.gz)
sha1sums=('8c8a8fe01ee1d2ff9868657a17f751c80534829d')
options=(staticlibs)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  FCCPP='/usr/bin/cpp -P -ansi' ./configure --prefix=/usr --enable-shared
  make
}

package() {

  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

}
