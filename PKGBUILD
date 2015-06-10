# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=ratfor
pkgver=1.0
pkgrel=1
pkgdesc='Preprocessor for fortran'
url='http://sepwww.stanford.edu/doku.php?id=sep:software:ratfor'
license=('unknown')
arch=('x86_64' 'i686')
makedepends=('setconf')
source=('http://sepwww.stanford.edu/lib/exe/fetch.php?media=sep:software:ratfor77.tar.gz')
sha256sums=('695fb151e8b4bde74bbbbbb9eff72b4ad2d5b1bfe839ec036f0288de4fe7c1bc')

prepare() {
  cd ratfor77
  chmod 644 *
  setconf Makefile ALL ratfor77
}

build() {
  make -C ratfor77
}

package() {
  install -Dm755 ratfor77/ratfor77 "$pkgdir/usr/bin/ratfor"
} 

# vim:set ts=2 sw=2 et:
