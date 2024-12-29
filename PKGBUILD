# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="slice99"
_commit_rel="38841ee5c152b49d79fb26f897a447c4d155c2c6" # 0.7.7
_commit="63404eb62d93011a699d72e0e0713fef6867f90e" # r10
pkgver="0.7.7+r10+g${_commit::7}"
pkgrel=1
pkgdesc="Full-featured interfaces for C99"
arch=('any')
url="https://hirrolot.github.io/slice99"
_url="https://github.com/hirrolot/${pkgname}"
license=('MIT')
checkdepends=('cmake>=3.16')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('de1ddfc74bf6abb3fdfe57c25f661100c939378196be412aa1deab9567bd0f7e')

check() {
  cd "${srcdir}/${_pkgsrc}"
  chmod +x ./scripts/test.sh
  ./scripts/test.sh
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "${pkgname}.h" "${pkgdir}/usr/include/${pkgname}.h"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
