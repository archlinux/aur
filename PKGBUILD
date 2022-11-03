# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rgsepd
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Gene Set Enrichment / Projection Displays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biomart
  r-deseq2
  r-go.db
  r-goseq
  r-gplots
  r-hash
  r-org.hs.eg.db
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-boot
  r-knitr
  r-tools
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7e1d65d93da79f409f627739a89a6587586d360a9a71fff60ccf8a6ec68866ae')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
