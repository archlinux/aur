# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tweeDEseq
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=1.58.0
pkgrel=1
pkgdesc='RNA-seq data analysis using the Poisson-Tweedie family of distributions'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cqn
  r-edger
  r-limma
  r-rcpp
)
optdepends=(
  r-tweedeseqcountdata
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2ee6e23e7d0902304fd5b12180ce80fca2a6e4cbef0ec59fe42b2952cd77cf74')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
