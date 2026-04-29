# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=coGPS
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="cancer outlier Gene Profile Sets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-limma
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2d44198628c6c68c5d8b07f041817bf5')
b2sums=('6f6f30afbaadcbb8103260b9f5cd832bab398ce705a86bba71f0895263ab94f5d7ebc9e87e2768b9194ee35ca13ab13e99e826eb9a679b0631381962b55bf299')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
