# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bugsigdbr
_pkgver=1.6.5
pkgname=r-${_pkgname,,}
pkgver=1.6.5
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
sha256sums=('38ec8b7158aaabe115c53cd2ec67f29a9e9c05160e3cde826993576f6a67887f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
