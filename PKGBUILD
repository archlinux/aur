# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocCheck
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bioconductor-specific package checks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocbaseutils
  r-biocfilecache
  r-biocmanager
  r-biocviews
  r-callr
  r-cli
  r-graph
  r-httr2
  r-knitr
  r-rvest
  r-stringdist
)
optdepends=(
  r-biocstyle
  r-devtools
  r-gert
  r-jsonlite
  r-rmarkdown
  r-tinytest
  r-usethis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8c3893efe1dd51dc71e73985b8b7d7ce')
b2sums=('0a9375fd8bf95c8196b54d90c74caaf538c7402c8745d0609956bbd70be82bd3b3081a720759742bf14e6f3d67d3405cb67ebb76738dc1108ff34c369b999c3f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
