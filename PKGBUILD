# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KEGGdzPathwaysGEO
_pkgver=1.45.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="KEGG Disease Datasets from GEO"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('93bf1c879e1a7e03ac105d779883383b')
b2sums=('5777ad9236c2f0b0db0e938c9d4f5185ad4170f1f1dceb5b8cce49a592e7f7da8dda7fd6aafd0eb7677ab15cc798795d38931c04d84f7d426a0fb0bedec4ff2c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
