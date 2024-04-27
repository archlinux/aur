# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=anota2seq
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=2
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
sha256sums=('562a98a6175eff25a4ff39493f35eeea0c38f44ccbc1d1c726bfe05d24e4dd4f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
