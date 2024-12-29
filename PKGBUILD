# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="metalang99"
pkgver=1.13.3
pkgrel=1
pkgdesc="Full-blown preprocessor metaprogramming"
arch=('any')
url="https://metalang99.readthedocs.io"
_url="https://github.com/hirrolot/${pkgname}"
license=('MIT')
checkdepends=('cmake>=3.16')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('91fe8d4edcc2e7f91c5b567a2b90f2e30c2373f1ebbabcf209ea0d74f63bc1e9')

check() {
  cd "${srcdir}/${_pkgsrc}"
  ./scripts/test.sh
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  find "include" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/{}" \;

  install -vDm644 "ARCHITECTURE.md" "${pkgdir}/usr/share/doc/${pkgname}/ARCHITECTURE.md"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "idioms.md" "${pkgdir}/usr/share/doc/${pkgname}/idioms.md"
  install -vDm644 "optimization_tips.md" "${pkgdir}/usr/share/doc/${pkgname}/optimization_tips.md"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
