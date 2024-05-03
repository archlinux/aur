# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IVAS
_pkgver=2.24.0
pkgname=r-${_pkgname,,}
pkgver=2.24.0
pkgrel=1
pkgdesc='Identification of genetic Variants affecting Alternative Splicing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-doparallel
  r-foreach
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggfortify
  r-ggplot2
  r-iranges
  r-lme4
  r-s4vectors
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2b782767ddf074fec93a7bbbe195f417830ad8d88cdf91834f071395d4c38096')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
