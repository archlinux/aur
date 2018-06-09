# Maintainer: Eric Le Lay <contact at elelay dot fr>
pkgname=ansifilter
pkgver=2.10
pkgrel=0
pkgdesc="remove or convert ANSI codes to another format"
arch=('i686' 'x86_64')
url='http://www.andre-simon.de/doku/ansifilter/en/ansifilter.php'
license=('GPL3')
depends=(gcc-libs)
makedepends=()
optdepends=()
source=("http://www.andre-simon.de/zip/$pkgname-$pkgver.tar.bz2")
sha256sums=('23d2cf439d4ed4fbec8050b2826d61c244694ce06aaf8ca7d0ec1016afebee3f')

build() {
  cd "$pkgname-$pkgver"

  make all
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  rm "$pkgdir/usr/share/doc/ansifilter/COPYING" \
     "$pkgdir/usr/share/doc/ansifilter/INSTALL"
}
