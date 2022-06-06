
_pkgname=MetaVolcanoR
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='An annotation and visualization package for multi-types and multi-groups expression data in KEGG pathway'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-dplyr
  r-tidyr
  r-plotly
  r-ggplot2
  r-cowplot
  r-metafor
  r-metap
  r-rlang
  r-topconfects
  r-htmlwidgets
)
makedepends=(
  git
  tar
)
optdepends=(
    r-knitr
    r-markdown
    r-rmakrdown
    r-testthat
 )
source=("git+https://git.bioconductor.org/packages/${_pkgname}.git")
sha256sums=('SKIP')

build() {
  tar -zcvf ${_pkgname}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
