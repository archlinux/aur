# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=epihet
_pkgver=1.13.0
pkgname=r-${_pkgname,,}
pkgver=1.13.0
pkgrel=1
pkgdesc='Determining Epigenetic Heterogeneity from Bisulfite Sequencing Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-data.table
  r-doparallel
  r-entropyexplorer
  r-foreach
  r-genomicranges
  r-ggplot2
  r-igraph
  r-iranges
  r-pheatmap
  r-qvalue
  r-reactomepa
  r-rtsne
  r-s4vectors
  r-wgcna
)
optdepends=(
  r-clusterprofiler
  r-ggfortify
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f928a39240a5e5a7de7d75b15fa2da62d01b3e6c276cb01d80467a34c87abadc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
