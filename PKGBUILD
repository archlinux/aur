# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="tinytetris"
_commit="38d4cc33cd31fc30ac4599df793164b3ff3c3327"
pkgver="r11+g${_commit::7}"
pkgrel=1
pkgdesc="80x23 terminal tetris!"
arch=('x86_64')
url="https://github.com/taylorconor/${pkgname}"
license=('Apache-2.0')
depends=('glibc' 'ncurses')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('8ca9c0fb02b003979e90a86eafc69ca51b78a773c3cda007da2be8ef185bf147')

build() {
  cd "${srcdir}/${_pkgsrc}"
  g++ ${CFLAGS} ${LDFLAGS} -o "${pkgname}" "${pkgname}.cpp" -lncurses
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
