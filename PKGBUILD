# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="obj.h"
_commit="c9f00cf063fb1f54a5e5c87a60af69564e719a8f" # r204
pkgver="r204+g${_commit::7}"
pkgrel=1
pkgdesc="OOP in pure C with a single-header"
arch=('any')
url="https://github.com/small-c/${pkgname}"
license=('MIT')
checkdepends=('xmake')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('33d6aec1cf0f2afc74fa233a73a12fccef2afecbc030a4205c23f4063756d59a08c9bed99a78c9bd1e20eaecabedc64af6a35b47ba4aeaccbe9413f3805f74b7')

check() {
  cd "${srcdir}/${_pkgsrc}"
  xmake
  xmake run
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "${pkgname}" "${pkgdir}/usr/include/${pkgname}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
