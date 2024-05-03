# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqsetvis
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Set Based Visualizations for Next-Gen Sequencing Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-cowplot
  r-data.table
  r-eulerr
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-ggplotify
  r-iranges
  r-limma
  r-pbapply
  r-pbmcapply
  r-png
  r-rcolorbrewer
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-scales
  r-upsetr
)
optdepends=(
  r-biocfilecache
  r-biocmanager
  r-biocstyle
  r-chippeakanno
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ba6a7e6bfef11d4535a0f0029760b4c49c67dc693e1aec52a71c9a3153565fa9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
