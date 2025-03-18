# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="slice99"
pkgver=0.7.8
pkgrel=1
pkgdesc="Memory slices for C99"
arch=('any')
url="https://hirrolot.github.io/slice99"
_url="https://github.com/hirrolot/${pkgname}"
license=('MIT')
checkdepends=('cmake>=3.16')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('07b06b29d06eb74798d85e34b2b50af330f5480e96457bcbfd20f5c6f61d1a30')

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
