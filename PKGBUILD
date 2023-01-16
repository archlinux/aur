# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=this.path
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=1.2.0
pkgrel=1
pkgdesc="Get Executing Script's Path, from 'RStudio', 'Rgui', 'VSCode', 'Rscript' (Shells Including Windows Command-Line / / Unix Terminal), and 'source'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-knitr
  r-microbenchmark
  r-rprojroot
  r-rstudioapi
  r-testthat
  r-utils
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2532fd20066ce3aaea1519387561dc75158e8ac5956aa3cb4a84b2b1abd6389d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
