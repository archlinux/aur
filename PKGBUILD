# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocSet
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
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
sha256sums=('8a73bb57f67eb7c353f405b34c5287169ab63ddb84ea77661bd13e7c667031e4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
