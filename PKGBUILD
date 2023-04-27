# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AnnotationFilter
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Facilities for Filtering Bioconductor Annotation Resources'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-genomicranges
  r-lazyeval
)
optdepends=(
  r-biocstyle
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-rsqlite
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('89b2e4cea9b5b44da8b2213228dacafb73c7f29b1b9f3418023943adabec5382')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
