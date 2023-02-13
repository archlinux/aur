# Maintainer: Alexander Bocken <alexander@bocken.org>

_cranname=gtrendsR
_cranver=1.5.1
_updatedate=2022-05-24
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Perform and Display Google Trends Queries"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=('r>=3.5.0' r-ggplot2 r-jsonlite r-anytime r-curl)
optdepends=(r-knitr r-rmarkdown r-tinytest)
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=(5d5c4e534e33c8a1908cee0a983675ac534d743e9b023a106d56bc750e636e15)

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
