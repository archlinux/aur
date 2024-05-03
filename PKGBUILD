# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msigdb
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('206353c6488487d097dab6297db1d673bf1057f0748e1c3aee0a622e75aa1c20')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
