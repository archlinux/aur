# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="metalang99"
pkgver=1.13.5
pkgrel=1
pkgdesc="Full-blown preprocessor metaprogramming"
arch=('any')
url="https://metalang99.readthedocs.io"
_url="https://github.com/hirrolot/${pkgname}"
license=('MIT')
checkdepends=('cmake>=3.16')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f3d1607d76b4b081d3295661c4c2b8d5fde4d5018b1aa409c84fb3a6660ffb90')

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
