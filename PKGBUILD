# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=libxc
pkgver=4.2.3
pkgrel=1
pkgdesc="library of exchange-correlation functionals for density-functional theory"
arch=('i686' 'x86_64')
url="http://www.tddft.org/programs/octopus/wiki/index.php/Libxc"
license=('LGPL')
makedepends=('gcc' 'gcc-fortran')
optdepends=()
source=(http://www.tddft.org/programs/octopus/down.php?file=libxc/$pkgver/libxc-$pkgver.tar.gz)
sha1sums=('7295ccb5f7641045cc475b8e649f04733f2d15ac')
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
