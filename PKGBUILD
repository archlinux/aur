# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DSS
_pkgver=2.50.1
pkgname=r-${_pkgname,,}
pkgver=2.50.1
pkgrel=1
pkgdesc='Dispersion shrinkage for sequencing data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocparallel
  r-bsseq
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4051ad59f9e44636a1f02ccb10127403543b7d88038e3015b1838b3f91204df2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
