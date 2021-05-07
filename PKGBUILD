# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=marst
pkgver=2.7
pkgrel=2
pkgdesc="Algol to C translator"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/marst/marst.html"
license=('GPL3')
options=('!libtool')
source=(https://ftp.gnu.org/pub/gnu/marst/$pkgname-$pkgver.tar.gz)
md5sums=('d930f88be1f4ba8442241c219d677ee6')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
}
