# system requirements: gsl
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DirichletMultinomial
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
pkgrel=1
pkgdesc='Dirichlet-Multinomial Mixture Model Machine Learning for Microbiome Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biocgenerics
  r-iranges
  r-s4vectors
  gsl
)
optdepends=(
  r-lattice
  r-mass
  r-parallel
  r-rcolorbrewer
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('82a455bda5e88ccccb49481a8322eb41f2f299ee2da31528c90a2572a17954ef')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
