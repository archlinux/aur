# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clustComp
_pkgver=1.32.0
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
md5sums=('e35cf0cc495d0bfa61c0d82f974d470f')
b2sums=('2d97dc352d49886d9c744d8f9bb1957c98f5325852ac7581fadcebfba19a3b44397523dd69b0ced47b7bca7b1e5ba8382333c68e6165f5f2055dab4757f79e8f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
