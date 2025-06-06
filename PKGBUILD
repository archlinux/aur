# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bugsigdbr
_pkgver=1.14.3
pkgname=r-${_pkgname,,}
pkgver=1.14.3
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
sha256sums=('049ae370e0c60ef736b511204b4c8bb76d4f79b18b86e325b0c5a9766223b97a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
