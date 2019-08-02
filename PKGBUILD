# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=libxc3
_pkgname=libxc
pkgver=3.0.1
pkgrel=1
pkgdesc="library of exchange-correlation functionals for density-functional theory (version 3)"
arch=('i686' 'x86_64')
url="http://www.tddft.org/programs/octopus/wiki/index.php/Libxc"
license=('MPL2')
provides=(libxc)
conflicts=(libxc)
makedepends=('gcc' 'gcc-fortran')
optdepends=()
source=(http://www.tddft.org/programs/octopus/down.php?file=libxc/$pkgver/libxc-$pkgver.tar.gz)
sha256sums=('836692f2ab60ec3aca0cca105ed5d0baa7d182be07cc9d0daa7b80ee1362caf7')
options=(staticlibs)

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  FCCPP='/usr/bin/cpp -P -ansi' ./configure --prefix=/usr --enable-shared
  make
}

package() {

  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

}
