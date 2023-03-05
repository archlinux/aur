# system requirements: ncbi-blast+ (see<https://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download>)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=protr
_pkgver=1.6-3
pkgname=r-${_pkgname,,}
pkgver=1.6.3
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
sha256sums=('d3eed30f31e907f9feca5562e1f1e97fc82fa68936df6fccf6e3e6db9041bd49')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
