# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bugsigdbr
_pkgver=1.6.4
pkgname=r-${_pkgname,,}
pkgver=1.6.4
pkgrel=1
pkgdesc='R-side access to published microbial signatures from BugSigDB'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocfilecache
  r-vroom
)
optdepends=(
  r-biocstyle
  r-knitr
  r-ontologyindex
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('66d2dcee40ac1df3fad9844c303a9ddf4204bd1b99c052dd2d80baab6b4988d7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
