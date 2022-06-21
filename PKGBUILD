# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=limma
_pkgver=3.52.2
pkgname=r-${_pkgname,,}
pkgver=3.52.2
pkgrel=1
pkgdesc='Linear Models for Microarray Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-affy
  r-annotationdbi
  r-biasedurn
  r-biobase
  r-ellipse
  r-go.db
  r-gplots
  r-illuminaio
  r-locfit
  r-mass
  r-org.hs.eg.db
  r-splines
  r-statmod
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c5ccd94d05286cfdbbe7e139281e2a6c41e62b3446e3e1da170e1157f1451755')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
