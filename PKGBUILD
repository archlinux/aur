# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=minfi
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=1.48.0
pkgrel=1
pkgdesc='Analyze Illumina Infinium DNA methylation arrays'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-beanplot
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bumphunter
  r-data.table
  r-delayedarray
  r-delayedmatrixstats
  r-genefilter
  r-genomeinfodb
  r-genomicranges
  r-geoquery
  r-hdf5array
  r-illuminaio
  r-iranges
  r-limma
  r-mclust
  r-nor1mix
  r-preprocesscore
  r-quadprog
  r-rcolorbrewer
  r-reshape
  r-s4vectors
  r-siggenes
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-digest
  r-flowsorted.blood.450k
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylation450kmanifest
  r-knitr
  r-minfidata
  r-minfidataepic
  r-rmarkdown
  r-runit
  r-tools
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1d2871388bbdd7b40185a660a683523b2ec856775944576eaeb56e64e46f948e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
