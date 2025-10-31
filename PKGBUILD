# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Mergeomics
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrative network analysis of omics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('03087aabc797e9f8c777718625320ffd')
b2sums=('ab1ca521ebd4ecc2c21c1a1f7bed56fcba8abe0f7c9f4c61f75fb7ece4e6353de939d395f71891e101f102ddfab7e26da7010942a77971ee602dac5a4fb54883')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
