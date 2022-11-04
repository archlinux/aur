# system requirements: Ensembl VEP (API version 104) and the Perl modulesDBI and DBD::mysql must be installed. See the package READMEand Ensembl installation instructions:http://www.ensembl.org/info/docs/tools/vep/script/vep_download.html#installer
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ensemblVEP
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=4
pkgdesc='R Interface to Ensembl Variant Effect Predictor'
arch=('any')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-genomeinfodb
  r-genomicranges
  r-s4vectors
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-runit
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c8ac6f434fe43cfc9bb1d7fe39bd233a4c93b2809dc72bcc736083df9bae94f6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
