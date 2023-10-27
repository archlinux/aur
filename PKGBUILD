# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rsnps
_pkgver=0.6.0
pkgname=r-${_pkgname,,}
pkgver=0.6.0
pkgrel=4
pkgdesc="Get 'SNP' ('Single-Nucleotide' 'Polymorphism') Data on the Web"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-crul
  r-data.table
  r-httr
  r-jsonlite
  r-plyr
  r-stringr
)
optdepends=(
  r-knitr
  r-markdown
  r-testthat
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5704f6762ffb8863a8f7fe48ed3a7408fb4890b402749ced2eae93ccf0e354e3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
