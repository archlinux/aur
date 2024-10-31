# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocSet
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
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
sha256sums=('60eeee975d23b391093b49663a5deb4b906fe274fc08d3e619c8b26ff2c084ca')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
