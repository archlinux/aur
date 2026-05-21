# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IMMAN
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interlog protein network reconstruction by Mapping and Mining ANalysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-igraph
  r-pwalign
  r-seqinr
  r-stringdb
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2670cb4dbc1d022b118d851b79b98bd3')
b2sums=('4263f7f7bc5cb6c4b64becd5f1ee7250dfdb36afc2c9595d9ecc71f01c7d8b4cd428efb3632109cda5cb50446a177b45ef1dcfea44d7c51ccd891a1d60f6e118')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
