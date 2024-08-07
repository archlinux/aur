# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=psychTools
_pkgver=2.4.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools to Accompany the 'psych' Package for Psychological Research"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-psych
  r-rtf
)
optdepends=(
  r-gparotation
  r-knitr
  r-lavaan
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2787cfe0c035647c0d9c5a825f98ae0f')
b2sums=('e415d716795a59ad283189f1674df50b17dbb8df7d1444143496e08bc24f78ce478af8b6b9ec0dc62bce861fe47b82acd8bc9416ac899a2227619531512ef8ad')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
