# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="tinyc"
pkgver=20241117
pkgrel=1
pkgdesc="Compiler for the Tiny-C language, a stripped down version of C"
arch=('x86_64')
url="https://www-labs.iro.umontreal.ca/~felipe/IFT2030-Automne2002"
license=('custom')
depends=('glibc')
source=("${pkgname}.c::https://www.iro.umontreal.ca/~felipe/IFT2030-Automne2002/Complements/tinyc.c")
sha256sums=('73856d66a6e101bc6df22c21fa0e445bafa6f2cce6df223cb4de249238ed2c1f')

pkgver() {
  date +%Y%m%d
}

build() {
  cd "${srcdir}"
  gcc ${CFLAGS} ${LDFLAGS} -o "${pkgname}" "${pkgname}.c"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
