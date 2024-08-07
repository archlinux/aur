# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=psychTools
_pkgver=2.4.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=0
pkgdesc="Tools to Accompany the psych Package for Psychological Research"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-psych
  r-foreign
  r-rtf
)
optdepends=(
  r-knitr
  r-lavaan
  r-gparotation
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('86d1ff498870a6e3a65fecc62ccfdabc')
b2sums=('fd3af9f5474356847884048c4f9677987ee1e37d3efbcbb41b54927ef28a00d01bab748282b7a6916519e8fa6f6c4c0c2e5475d4aa7b98ee09b3be631cc6d244')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
