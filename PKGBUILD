# Maintainer: Michael J. Pento <mpento darkforge net>

pkgname=objconv
pkgver=2.54
pkgrel=1
pkgdesc='Object file converter and disassembler'
arch=('i686' 'x86_64')
url="http://www.agner.org/optimize/#objconv"
license=('GPL')
depends=('gcc-libs')
source=("$pkgname-$pkgver.zip::http://www.agner.org/optimize/objconv.zip")
sha256sums=('483c27a4f1dcd8dc9cb712913ab8630835ecdfa5868fc8ece5b95a4245226d61')

prepare() {
  mkdir build
  bsdtar -xf source.zip -C build
}

build() {
  cd build
  g++ -v -o objconv -O2 *.cpp
}

package() {
  install -D -m755 build/objconv "$pkgdir"/usr/bin/objconv
  install -D -m755 objconv-instructions.pdf "$pkgdir"/usr/share/doc/$pkgname/manual.pdf
}
