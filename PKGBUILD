# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BridgeDbR
_pkgver=2.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Code for using BridgeDb identifier mapping framework from within R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-curl
  r-rjava
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c6fe3d37ebcfc47442a0f46cd921ab18')
b2sums=('842ef8aa17e20b21cb25d2614f0c60edec07f693245497f7617734a6219253b09d6d954483d662b2c34bffb9a70cb0a1ea7f30308e9623301f7887a343ed45a2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
