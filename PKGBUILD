# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BHC
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Bayesian Hierarchical Clustering"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('855087c8854bd3014111477e1c3cdcb9')
b2sums=('8618c469025c895d42d5e6cd12099b8e25ec6b77b0e56371987d88bdece28d36248435d2ff7e748e08862fa74c4d30b8d41dd6a66fc335f6faf91b434ef76ae4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
