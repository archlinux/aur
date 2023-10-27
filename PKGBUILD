# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=conumee
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Enhanced copy-number variation analysis using Illumina DNA methylation arrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-dnacopy
  r-genomeinfodb
  r-genomicranges
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylation450kmanifest
  r-illuminahumanmethylationepicanno.ilm10b2.hg19
  r-illuminahumanmethylationepicmanifest
  r-iranges
  r-minfi
  r-rtracklayer
)
optdepends=(
  r-biocstyle
  r-knitr
  r-minfidata
  r-rcurl
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e75a0aff3bcd1246d15841de749e211fbbe9be12d50e2012e8bb5e3e8a00c8f2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
