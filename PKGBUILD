# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRcomp
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Tools to assess and compare miRNA expression estimatation methods"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-biobase
  r-mircompdata
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
  r-shiny
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('06b97d8829ca13b60dd4869a48b684ab')
b2sums=('5a1cccc61f8bcd4b8d24fc1f220d8fc44b7e09aa06ae724bfd52f755585193016a010c818e079aea7481409b03f79e50aa5dcfb32e5009073f4550419e65ff91')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
