# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=COSNet
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Cost Sensitive Network for node label prediction on graphs with highly unbalanced labelings"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-bionetdata
  r-perfmeas
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6648998ac68e41642f1a7bad77e0bb7f')
b2sums=('c6a46e8c457658d86ea381ab390b689ee74a3efabb4be81f54f143751cc176c70156f12c0fbc995bc065944e2e0c470345cd992a84b569ceb2d9ca8539339b87')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
