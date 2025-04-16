# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=coGPS
_pkgver=1.52.0
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
md5sums=('ea3637eff697595b2809dfa105155425')
b2sums=('067d5b4a60aa89a8808b7d4ebe7da8b24e02fef277dd0d140b7d604564a01c3ecde797b4f3a17ccdad73b2a68e929f657f1a3f85fcb83fdf5949f057d9eb1468')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
