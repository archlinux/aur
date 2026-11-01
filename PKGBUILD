# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HGNChelper
_pkgver=0.8.16
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identify and Correct Invalid HGNC Human Gene Symbols and MGI Mouse Gene Symbols"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-splitstackshape
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('32a9207a8533a04a582307b7ac18c47f')
b2sums=('674efb286d8dd56aa75205157f8fd03ae066eaaf4214c4e29577bb9ac29c6ff603d6d21335ef36df9168736b459eeb62f622e5a23b975c13948dfaac28b26abe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
