# Contributor: Daniel YC Lin <dlin (at) gmail.com>
# Maintainer: Daniel YC Lin <dlin (at) gmail.com>
pkgname=bcpp
pkgver=20180401
pkgrel=1
pkgdesc="utility for indents C/C++ source programs"
arch=('i686' 'x86_64' sh4)
url="http://dickey.his.com/bcpp/bcpp.html"
license=("custom")
makedepends=(gcc)
depends=(bash)
source=(http://invisible-island.net/datafiles/release/bcpp.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man || return 1
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  cp code/bcpp.cfg "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses/bcpp"
  install -m644 COPYING "$pkgdir/usr/share/licenses/bcpp/"
}
md5sums=('c3559098a2af739aafdf7ca265c02d49')
