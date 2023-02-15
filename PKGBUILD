# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=httr2
_cranver=0.2.2
_updatedate=2022-09-26
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Perform HTTP Requests and Process the Responses"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=('r>=3.4' 'r-cli>=3.0.0' 'r-curl' 'r-glue' 'r-magrittr' 'r-openssl' 'r-r6' 'r-rappdirs' 'r-rlang>=1.0.0' 'r-withr')
optdepends=('r-askpass' 'r-bench' 'r-clipr' 'r-covr' 'r-docopt' 'r-httpuv' 'r-jose' 'r-jsonlite' 'r-knitr' 'r-purrr' 'r-rmarkdown' 'r-testthat>=3.0.0' 'r-tibble' 'r-webfakes' 'r-xml2')
source=(https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz)
sha256sums=(5d1ab62541f7817112519f0f9d00d6a2555bab5b2da7f5c6d579b0c307d7f2bf)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
