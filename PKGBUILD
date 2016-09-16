# Maintainer: Eric Le Lay <contact at elelay dot fr>
pkgname=ansifilter
pkgver=2.2
pkgrel=1
pkgdesc="remove or convert ANSI codes to another format"
arch=('i686' 'x86_64')
url='http://www.andre-simon.de/doku/ansifilter/en/ansifilter.php'
license=('GPL3')
depends=(gcc-libs)
makedepends=()
optdepends=()
source=("http://www.andre-simon.de/zip/$pkgname-$pkgver.tar.bz2")
sha256sums=('af862f9c381100d9307fa20a7cc66888bf582581249c0fc79b2447dbc41c30b9')

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
