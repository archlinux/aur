# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MantelCorr
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compute Mantel Cluster Correlations"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f98fae810a791f6de47a42ce6a7de462')
b2sums=('68db4acaa8f3872963de357ae3489884f38b0b0ecc979561aa9ab1be8f5718b13a2541f1d9f120d00e9272ac8b887675248eef6d6bbcd7c9d17a5deb13432013')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
