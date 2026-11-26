# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ReUseData
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Reusable and reproducible Data Management"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-basilisk
  r-biocfilecache
  r-jsonlite
  r-rcwl
  r-rcwlpipelines
  r-s4vectors
  r-yaml
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1cbaaa8baf0bc358103ce7ed392f9204')
b2sums=('f0934dd9c34efeb055aa82eecd66a6848319cb916ec7392837d71c8b42943a8577c71d6fde28361445b9626d6f95d3817c145191f53a38a1f51c661edf484c09')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
