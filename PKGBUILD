# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IsoGeneGUI
_pkgver=2.31.0
pkgname=r-${_pkgname,,}
pkgver=2.31.0
pkgrel=4
pkgdesc='A graphical user interface to conduct a dose-response analysis of microarray data'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-ff
  r-geneplotter
  r-goric
  r-iso
  r-isogene
  r-jpeg
  r-multtest
  r-orcme
  r-oriclust
  r-orqa
  r-rcolorbrewer
  r-rcpp
  r-relimp
  r-tkrplot
  r-xlsx
)
optdepends=(
  r-runit
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f6f5719df91c062ef1ac9241caf4838d79f717de4175f49064e86756b7eefff0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
