# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=anota2seq
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Generally applicable transcriptome-wide analysis of translational efficiency using anota2seq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-deseq2
  r-edger
  r-limma
  r-multtest
  r-qvalue
  r-rcolorbrewer
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1fa54f91e337c8df5d384d7cad13c28a9bc3383887ca6f7f7cf94ff2c3b2d3bb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
