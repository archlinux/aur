# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=psychTools
_pkgver=2.5.7.22
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
md5sums=('57d6512a2a9e979085ea1ad144fa61e7')
b2sums=('f9d51264c4ac2266aa401fed51c01ab9ab7485592fb92105d89e32f9cc5fa5366e135191ebfe39ff83eede9e5983ca26cd1ca16e7c78c81b9243d6588a2b59b8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
