# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocCheck
_pkgver=1.48.1
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
  r-commonmark
  r-graph
  r-httr2
  r-knitr
  r-rvest
  r-stringdist
  r-xml2
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
md5sums=('4ab8930a364b682db558bdf054c2f21c')
b2sums=('09ea0bc3684aca0a3533aeb6051024df5998777b0890dd4a8633c0dbe4a5aa14a160099b17a21c0fedcfc03ddf767eeb7833c5eb18521541123f57b5505e9c11')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
