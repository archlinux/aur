# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=eiR
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=1.44.0
pkgrel=1
pkgdesc='Accelerated similarity searching of small molecules'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-chemminer
  r-dbi
  r-digest
  r-rcppannoy
  r-rcurl
  r-runit
  r-snow
  r-snowfall
)
optdepends=(
  r-biocstyle
  r-knitcitations
  r-knitr
  r-knitrbootstrap
  r-rmarkdown
  r-rsqlite
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5b5482793a867bed3e36f8553b40260ac82369741d09fb2297502b2de4f348c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
