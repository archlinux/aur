# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KEGGandMetacoreDzPathwaysGEO
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Disease Datasets from GEO"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8869e7773c26a4e3f6bbd61790e321fb')
b2sums=('f721023502d322441043d1d85ef80b0f875b3a0f692ec3dd47c8131e228211ed2982044b22685ce3a5b3d39f9abae561ca10e94b80342a43c430893d9201b027')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
