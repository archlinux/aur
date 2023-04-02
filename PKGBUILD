# Maintainer: Michael J. Pento <mpento darkforge net>

pkgname=objconv
pkgver=2.54
pkgrel=2
pkgdesc='Object file converter and disassembler'
arch=('i686' 'x86_64')
url="http://www.agner.org/optimize/#objconv"
license=('GPL')
depends=('gcc-libs')
source=("$pkgname-$pkgver.zip::http://www.agner.org/optimize/objconv.zip")
sha256sums=('0c5ca8fbc7ef1c4afe3cc7cc9018711a5885afacbe8bcebc48028d1ec90ccc7c')

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
