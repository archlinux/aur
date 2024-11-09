# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBASED
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Package containing functions for ASE analysis using Meta-analysis Based Allele-Specific Expression Detection'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-genomicranges
  r-runit
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6a0e82de50fad564dad62b80e86ba624c2b4132437ac841e17123bc11c92e300')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
