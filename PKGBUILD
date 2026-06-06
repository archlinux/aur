# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=airr
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="AIRR Data Representation Reference Library"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('CC-BY-4.0')
depends=(
  r-jsonlite
  r-readr
  r-stringi
  r-yaml
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bbd29d5491e4f970d1093064d7e27902')
b2sums=('47459c82724ba296227b75fec5c79523eaef00a23a63cd11fca2c26f75e82749f8c0f88c9cc79f4325895b9067b6f9305c4b163d351f0ea5c5c36dbdd5a95770')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
