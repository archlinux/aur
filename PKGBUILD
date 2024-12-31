# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="clofn"
_commit="6a159aa70586c813b71404328aec0bb97abd174f" # r5
pkgver="r5+g${_commit::7}"
pkgrel=1
pkgdesc="Closure function implementation for C"
arch=('any')
url="https://github.com/yulon/${pkgname}"
license=('custom:None')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('fcea33f6a0c2a7ba660c07750a58acd3253dd4a051ff92c9013282e68c40d3d7c41f4b430e8eb8f7db0168c8ad2c8aa7fce68325734aa3f2fd5d2382b47e3980')

check() {
  cd "${srcdir}/${_pkgsrc}"
  gcc ${CFLAFS} ${LDFLAGS} test.c -o test
  ./test
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "${pkgname}.h" "${pkgdir}/usr/include/${pkgname}.h"
}

# vim:set ts=2 sw=2 et:
