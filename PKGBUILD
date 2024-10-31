# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GeneExpressionSignature
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene Expression Signature based Similarity Metric"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
)
optdepends=(
  r-apcluster
  r-biocstyle
  r-geoquery
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4a1d31a2fe3f57f4429534a22317aee1')
b2sums=('de28478b0a3fc470ba9c0724876cd9f43134fa5a29d556bac024b75fde16ee951817923408fbded15afceb4f1e9f7f11b461c6db9cc5715b958355e351eb53da')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
