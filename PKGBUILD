# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msigdb
_pkgver=1.9.2
pkgname=r-${_pkgname,,}
pkgver=1.9.2
pkgrel=1
pkgdesc='An ExperimentHub Package for the Molecular Signatures Database (MSigDB)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-experimenthub
  r-gseabase
  r-org.hs.eg.db
  r-org.mm.eg.db
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-go.db
  r-knitr
  r-limma
  r-prettydoc
  r-rmarkdown
  r-singscore
  r-stringr
  r-testthat
  r-visse
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b1def7599668a7ba82762e18c93743b4d7ecb0df1ec1b188c742bfdc740ba633')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
