# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRcomp
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('24d0288947f10234d8c4a1b53c3bda4e')
b2sums=('b28565abec74feb206d9e7a152d362e734515bd47b94cdc1d5f4991e63ab702db1e2681be2fd4efc5a0d27deabf9a784dbeded26a3f6e77b7ed1a3eb45d87514')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
