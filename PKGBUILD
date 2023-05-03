# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneSelectMMD
_pkgver=2.44.1
pkgname=r-${_pkgname,,}
pkgver=2.44.1
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
sha256sums=('1ee9ffac8d41cd88b2786de79dbec6d6adec42f74527971250c067dd7043a433')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
