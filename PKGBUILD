# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bladderbatch
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bladder gene expression data illustrating batch effects"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('46e326c3d371551aeda16e9edd9a63db')
b2sums=('68d8cf442d52274571c9ba8ee0918f9cfe6fc43780da324e451965ac75237477f26c8c1579185e64ca3b787a9ccf03abbe64a86329e15120fcc33a3b6dcaa664')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
