# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MantelCorr
_pkgver=1.78.0
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
md5sums=('d98e70d0b50358a396b9421cfb86b68e')
b2sums=('901f63063600c93f26abaf88cc3b4f6fd8f1972813aca63296bfa09d4c07fb750b6a5b5440c89092f2085836a8cff26f7293dad8a5598ebd59b0426175810cfe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
