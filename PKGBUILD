# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneSelectMMD
_pkgver=2.42.3
pkgname=r-${_pkgname,,}
pkgver=2.42.3
pkgrel=1
pkgdesc='Gene selection based on the marginal distributions of gene profiles that characterized by a mixture of three-component multivariate distributions'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-limma
)
optdepends=(
  r-all
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('28fa02171c110d40efb3687af3c8b4a94d1df6633fa1caa019cb1bb09318f8e4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
