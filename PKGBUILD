# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tweeDEseq
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=1.42.0
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
)
optdepends=(
  r-tweedeseqcountdata
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2fe155723a8c2c22613cbc774530f6561217c9819e2b8d9d9ce6ab6508a44a94')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
