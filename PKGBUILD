# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fmcsR
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='Mismatch Tolerant Maximum Common Substructure Searching'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-chemminer
  r-runit
)
optdepends=(
  r-biocstyle
  r-knitcitations
  r-knitr
  r-knitrbootstrap
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8ad4907bfbfd9e11d515b9a4c14ce7146e7efacf3fc7b2c74cdb77266376a5fd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
