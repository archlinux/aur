# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tweeDEseq
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
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
sha256sums=('039fd5cb898ed19bdd7e83ab727064f0141b52c837637c2c682c4c623ab8b956')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
