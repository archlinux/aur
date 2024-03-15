# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VAM
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Variance-Adjusted Mahalanobis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-sctransform
  r-seurat
  r-seuratobject
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2583e8a4fe9ceedc14cb233e3a7b16b5')
b2sums=('58be1d9e5efdcacee377d5d1e15a8f0c49a44c3e3c6c7308af9bb5c498322d2c231666c9f2926a4b53883457f7af62c3db1bb35c55d95ab79e195bbce59a6da0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
