# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=seqmagick
_pkgver=0.1.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sequence Manipulation Utilities"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biostrings
  r-magrittr
  r-yulab.utils
)
optdepends=(
  r-genomicalignments
  r-genomicranges
  r-iranges
  r-knitr
  r-muscle
  r-prettydoc
  r-rmarkdown
  r-rsamtools
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('15fe550ba1b3d9287f27c0647fcd4e64')
b2sums=('b192ca63bf642a60ea0649490f3b40b409dd2d4b4a5a2164837e86e29897f46aed9c15543ca7009b142f264a896e31bce0fe6a91c3782001050bebc09f47164a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
