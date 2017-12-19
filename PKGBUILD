# Maintainer: Ivan Puntiy <ivan.puntiy@gmail.com>

pkgname=mingw-w64-flex-wrapper
pkgver=1
pkgrel=2
pkgdesc="Allows Flex to be used while compiling for mingw-w64"
arch=('any')
url="#"
license=('custom:wtfpl')
depends=('flex')
provides=('mingw-w64-flex')
source=(LICENSE)
sha256sums=('96f17857f3eb28a7d93dad930bc099a3cb65a9a2afb37069bfd1ba5ec5964389')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  for _arch in ${_architectures}; do
    install -m755 -d "${pkgdir}/usr/${_arch}/include"
    ln -s ../../include/FlexLexer.h "${pkgdir}/usr/${_arch}/include/"
  done

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
