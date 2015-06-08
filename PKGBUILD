# Maintainer: allspark <allspark at cyb0rg dot org>

pkgname=hashlibpp
pkgver=0.3.4
pkgrel=2
pkgdesc="Hashing library"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/hashlib2plus/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/project/hashlib2plus/$pkgver/hashlibpp_0_3_4.zip Makefile.patch)
noextract=()
md5sums=('ea5643e92d261258ecefbb92e398c572' '1d62e5ea8125d8a9ff054114956e2851')

build() {
  cd $srcdir/hashlib2plus/trunk/src
   patch -p0 -i ../../../Makefile.patch || return 1

  make -j1 || return 1
}

package() {
  cd $srcdir/hashlib2plus/trunk/src
  mkdir -p "$pkgdir"/usr/lib
  mkdir -p "$pkgdir"/usr/include

  make DESTDIR=$pkgdir install || return 1
}
