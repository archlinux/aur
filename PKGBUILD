# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=flif-git
pkgver=r33.232a336
pkgrel=1
pkgdesc="Free Lossless Image Format"
arch=(i686 x86_64)
url="https://github.com/jonsneyers/FLIF"
license=('GPL3')
makedepends=('git' 'make' 'gcc')
source=('git+https://github.com/jonsneyers/FLIF.git')
sha256sums=('SKIP')


pkgver() {
      cd "$srcdir/FLIF"
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/FLIF"
  make
}

package() {
  cd $srcdir/FLIF
  install -dm755 $pkgdir/usr/bin
  install -m755 flif $pkgdir/usr/bin 
}
