# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=googleCloudStorageR
_pkgver=0.7.0
pkgname=r-${_pkgname,,}
pkgver=0.7.0
pkgrel=4
pkgdesc='Interface with Google Cloud Storage API'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-cli
  r-curl
  r-googleauthr
  r-httr
  r-jsonlite
  r-openssl
  r-yaml
  r-zip
)
optdepends=(
  r-fs
  r-googlecomputeenginer
  r-knitr
  r-readr
  r-rmarkdown
  r-sodium
  r-testthat
  r-usethis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('37f8bc52a75adc481945384130b9dfc5a2905a6731e57953a36a9e100f82e8fa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
