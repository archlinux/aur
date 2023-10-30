# system requirements: ncbi-blast+ (see<https://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download>)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=protr
_pkgver=1.7-0
pkgname=r-${_pkgname,,}
pkgver=1.7.0
pkgrel=1
pkgdesc='Generating Various Numerical Representation Schemes for Protein Sequences'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
optdepends=(
  r-biostrings
  r-doparallel
  r-foreach
  r-gosemsim
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('44c22a7fbe169496f2bf3d25ac27044da36d746fcf1bb4f5424461d17abc6741')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
