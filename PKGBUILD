# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocCheck
_pkgver=1.46.0
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
md5sums=('bb96cb70ff53b55142384803fd23c406')
b2sums=('e4e9862dde97202618255b4940809e9cec4996740ddbe1a71f1988fdd556df394518ec6e2d26fe55edbe97ebe4ac2c2232ee3800e12e730801660647b8bdad39')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
