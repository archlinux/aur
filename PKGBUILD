# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocSet
_pkgver=1.17.1
pkgname=r-${_pkgname,,}
pkgver=1.17.1
pkgrel=1
pkgdesc='Representing Different Biological Sets'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biocio
  r-dplyr
  r-keggrest
  r-ontologyindex
  r-plyr
  r-rlang
  r-s4vectors
  r-tibble
  r-tidyr
)
optdepends=(
  r-airway
  r-biocfilecache
  r-biocstyle
  r-deseq2
  r-go.db
  r-gseabase
  r-knitr
  r-limma
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8d8c38257e1ae82a45948c985de20b2e55d2c634fd9957ae3bcb29c8cef9ebbb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
