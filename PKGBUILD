# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MethCP
_pkgver=1.7.0
pkgname=r-${_pkgname,,}
pkgver=1.7.0
pkgrel=2
pkgdesc='Differential methylation anlsysis for bisulfite sequencing data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocparallel
  r-bsseq
  r-dnacopy
  r-dss
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-methylkit
  r-s4vectors
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('76aef5e5e09d13775d9e1fb292b2aa81b393c2d7a44cd78ddbf14df672e5b0ea')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
