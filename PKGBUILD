# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SMVar
_pkgver=1.3.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Structural Model for Variances"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0cad7d2abfd4be6306eaf2bce923ce7d')
b2sums=('da5e76b6e6ecd9d2992943429056ee6956509e9414e15a537e640ecff7efe190029e5c6f726138fb325fac1ffec4fe1fc1d2c54f647d55fcedbacae4f46b912b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
