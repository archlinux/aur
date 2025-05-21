# Maintainer: David Sultaniiazov <x1z53@корсаков.рус>

pkgname=korsakov
pkgver=1.15.2
pkgrel=2
pkgdesc='Cyrillic multi-paradigm general-purpose programming language'
url='https://gitverse.ru/rus.yaz/korsakov'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('fasm')
source=(https://gitverse.ru/api/repos/rus.yaz/${pkgname}/archive/v${pkgver}-beta.tar.gz)
sha256sums=('f1cd472ce21111fdffc4d4f0006dbae9d0680d1584702fd750d04dc11fb7571b')

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
