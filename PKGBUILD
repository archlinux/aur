# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=picoasm
pkgver=0.2
pkgrel=2
pkgdesc="Assembler for the Xilinx PicoBlaze-3 soft-core processor"
arch=("i686" "x86_64")
url="http://marksix.home.xs4all.nl/picoasm.html"
license=("GPL2" "LGPL2.1")
depends=()
makedepends=(gcc)
options=('!strip')
source=(http://marksix.home.xs4all.nl/downloads/Picoasm_29mar08.tar.gz picoasm.patch)
md5sums=(58ef733437fff17bf73801270dd543d5 c3f2ce172a4b88ace764bc46d5b938e1)

build() {
  cd "$srcdir/Picoasm"
  patch -p1 <../../picoasm.patch
  make
}

package() {
  cd "$srcdir/Picoasm"
  install -D picoasm $pkgdir/usr/bin/picoasm
}

# vim:sw=2:
