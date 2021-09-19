# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: philomath <philomath868 AT gmail DOT com>
# Contributor: Boohbah <boohbah at gmail.com>

pkgname=objconv
pkgver=2.52
pkgrel=2
pkgdesc='Object file converter and disassembler'
arch=('i686' 'x86_64')
url="http://www.agner.org/optimize/#objconv"
license=('GPL')
depends=('gcc-libs')
source=("$pkgname-$pkgver.zip::http://www.agner.org/optimize/objconv.zip")
sha256sums=('7dbeaf3fc53ee2eca8ac9954db612f60a931917f34119576269f9121652bc23a')

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
