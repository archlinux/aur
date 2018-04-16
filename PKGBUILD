# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: philomath <philomath868 AT gmail DOT com>
# Contributor: Boohbah <boohbah at gmail.com>

pkgname=objconv
pkgver=2.49
pkgrel=1
pkgdesc='Object file converter and disassembler'
arch=('i686' 'x86_64')
url="http://www.agner.org/optimize/#objconv"
license=('GPL')
depends=('gcc-libs')
source=("$pkgname-$pkgver.zip::http://www.agner.org/optimize/objconv.zip")
sha256sums=('f2c0c4cd6ff227e76ffed5796953cd9ae9eb228847ca9a14dba6392c573bb7a4')

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
