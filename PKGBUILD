# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RGSEA
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Random Gene Set Enrichment Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-biocgenerics
)
optdepends=(
  r-biocstyle
  r-geoquery
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9e2d19b02f26dd235c432729600326be')
b2sums=('69dd3edcc7551e1e27fbfb527a05a4b31a6fd6895421ab27806641004291b3b1037143b1a42d61cc6b2fce53f7e745e9a152a52cccf95761ff2cf16880a6a9ac')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
