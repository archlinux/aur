# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneSelectMMD
_pkgver=2.50.0
pkgname=r-${_pkgname,,}
pkgver=2.50.0
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
sha256sums=('1dd9fd27b4ef9218d1388ecaa9a4bc463a8044718fcfa685b755079006186240')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
