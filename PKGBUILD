# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=limma
_pkgver=3.52.4
pkgname=r-${_pkgname,,}
pkgver=3.52.4
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
sha256sums=('b09ccf301dc4c4a83b712f3207dd651b420b2b32e7bfaec3f89909953d1ebe93')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
