# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=acde
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Artificial Components Detection of Differentially Expressed Genes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4d7e4da809d2ff1e75bfc69fde3d11f2')
b2sums=('ae9a65637f5b6d3fcc9d3713a6dac150314ba778d3ef084a7738093f356f2c54059e4f6730b68298b8f8043e8d18b767b086d43972f276183a3ca4fc4dc9b348')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
