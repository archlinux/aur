# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCASPAR
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package for survival time prediction based on a piecewise baseline hazard Cox regression model"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d6b29f80f202d281b777aea72b3e55b5')
b2sums=('59c0cdacf1159275b184f5f943bd63798242a64bdc4e913a00c2661a3664950cf1f3df199f34c068110e32e32e7539c10620d4e053aecbe620c18a0e9e8588ce')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
