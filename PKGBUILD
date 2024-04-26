# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=flowDensity
_pkgver=1.36.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Sequential Flow Cytometry Data Gating"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-car
  r-flowcore
  r-flowviz
  r-gplots
  r-polyclip
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('30c661d010484bff6c2eb427a7056aa1')
b2sums=('c5bd78f4ee9220d44e39e2465f4fcbd0a73e8a8cac97150b5553e4dc92d24b7b68b78b8a2fb94f76949b61b214e882bf29216c1a1465e0eeb4c8ef790d06dc09')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
