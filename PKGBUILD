# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GA4GHclient
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='A Bioconductor package for accessing GA4GH API data servers'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-httr
  r-iranges
  r-jsonlite
  r-s4vectors
  r-variantannotation
)
optdepends=(
  r-annotationdbi
  r-biocstyle
  r-dt
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('18be2fd82193aed79cb3386d059f677bc81f972f6cf70f12121527795ef6890a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
