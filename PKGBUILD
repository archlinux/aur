# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DExMAdata
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data package for DExMA package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6c03e9b7bdf0dd3c28a6aedbecf1de44')
b2sums=('ad565352cd893b3d851357a9d31c602f4ccfc9f26996e2a7325099d30013f87d4f0ca2229a575b2d1f8a0294e6adc273cab3f230568b81ddd203918a513c258a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
