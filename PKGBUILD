# Maintainer: Eric Le Lay <contact at elelay dot fr>
pkgname=ansifilter
pkgver=2.9
pkgrel=0
pkgdesc="remove or convert ANSI codes to another format"
arch=('i686' 'x86_64')
url='http://www.andre-simon.de/doku/ansifilter/en/ansifilter.php'
license=('GPL3')
depends=(gcc-libs)
makedepends=()
optdepends=()
source=("http://www.andre-simon.de/zip/$pkgname-$pkgver.tar.bz2")
sha256sums=('f9c4c0d8a4532b89ee16ff5ac51eee46dc581fb4cc50d51a97dddd15385abc3a')

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
