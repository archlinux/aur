# Maintainer: David Sultaniiazov <x1z53@корсаков.рус>

pkgname=korsakov
pkgver=1.15.4
pkgrel=2
pkgdesc='Cyrillic multi-paradigm general-purpose programming language'
url='https://gitverse.ru/rus.yaz/korsakov'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('fasm')
source=($pkgname::git+$url.git)
sha256sums=('SKIP')

build() {
  cd $pkgname

  fasm build.asm
  ld build.o -o build

  ./build
}

package() {
  cd $pkgname

  install -Dm 755 korsakov -t "$pkgdir/usr/bin"
}

pkgver() {
  cd $pkgname

  git describe --tags | sed 's|v\([^-]*\).*|\1|'
}
