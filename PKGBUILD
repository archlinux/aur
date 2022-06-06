# system requirements: gsl
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DirichletMultinomial
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
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
sha256sums=('bdae3433f4fcf27f8aae91f7ee5f14c4b6f6263d7ba89d4bcd9502f4b1808096')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
