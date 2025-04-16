# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clustComp
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clustering Comparison Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-sm
)
optdepends=(
  r-biobase
  r-biocgenerics
  r-colonca
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6023cc420d2983274906fcc3157b69a3')
b2sums=('ed866812d371d3b12e41ad62478a1083ee78fa173bf0577ffb0b6b8f12e2f58f49146d64381c826b5ebb11aa1fe993fdae04224804a4712add6ec243ff857a7b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
