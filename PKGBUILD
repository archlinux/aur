# Maintainer: R1chterScale <R1chterScale@protonmail.com>
pkgname=lance-git
pkgver=2.3.1.r0.geff854a
pkgrel=1
pkgdesc='A minimal basically-C compiler'
arch=('i686' 'x86_64')
url='https://codeberg.org/thesalt/lance'
license=('Unlicense')
makedepends=('gcc' 'make')
source=(git+"https://codeberg.org/thesalt/lance.git")
sha256sums=('SKIP')

pkgver() {
    git -C lance describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}
build() {
  cd "$srcdir/lance"
  make
}
package() {
  cd "$srcdir/lance"

  mkdir -p "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/usr/bin" install
}
