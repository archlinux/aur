# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=calm
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Covariate Assisted Large-scale Multiple testing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2294475aedb11cf37d5cd8a3bb1c9fd2')
b2sums=('d052a31a8e27a532ecf5e3b5424f10d74d46bd6d86dead1b7a8c637fb38647f1e63cf11aa80f2be14033ff4f7ff95a713692f4de1ba1d9422531b901e7a1547a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
