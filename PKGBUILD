# Maintainer: David Sultaniiazov <x1z53@корсаков.рус>

pkgname=korsakov
pkgver=1.15.2
pkgrel=1
pkgdesc='Cyrillic multi-paradigm general-purpose programming language'
url='https://gitverse.ru/rus.yaz/korsakov'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('fasm')
source=(https://gitverse.ru/api/repos/rus.yaz/${pkgname}/archive/v${pkgver}-beta.tar.gz)
sha256sums=('4e89d45fef0ac84c16c58c90847b4e2a8fc03fef58edf88f2d35e2b1b3902f4d')

build() {
  cd ${pkgname}

  fasm build.asm
  ld build.o -o build

  ./build
}

package() {
  cd ${pkgname}

  install -Dm 755 korsakov -t "${pkgdir}/usr/bin"
}
