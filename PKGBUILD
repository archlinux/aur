# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=anota2seq
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
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
sha256sums=('a387f7a3ccb98e45d70f035ada6d52471bb36ab2566d07c562b855a3dc7bef91')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
