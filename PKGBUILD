# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=libxc
pkgver=2.1.2
pkgrel=1
pkgdesc="library of exchange-correlation functionals for density-functional theory"
arch=('i686' 'x86_64')
url="http://www.tddft.org/programs/octopus/wiki/index.php/Libxc"
license=('LGPL')
makedepends=('gcc' 'gcc-fortran')
optdepends=()
source=(http://www.tddft.org/programs/octopus/download/libxc/libxc-$pkgver.tar.gz)
sha1sums=('d77180aac4e452f74608572db1eba0218af8c599')
options=(staticlibs)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  FCCPP='/usr/bin/cpp -P -ansi' ./configure --prefix=/usr
  make
}

package() {

  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

}
