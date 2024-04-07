# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rafalib
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Convenience Functions for Routine Data Exploration"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-rcolorbrewer
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ec2db844e21fa6b6ac29dc46d739a37')
b2sums=('42d2c2cb943cb69e8b19c5a52fe22f0c9d0079b8433e9868e6db47e8c7615cce811550ac7581dabdbf3b0f5e55f955243aa9bb36a167a697846b0e6133e0c8c0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
