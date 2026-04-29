# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dir.expiry
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Managing Expiration for Cache Directories"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-filelock
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d3eabae4bbbf1a529cb640f8899d7682')
b2sums=('bca9220c7e07113278ad6a5f78c79371e5dddcca87d118e30c943e1d31fe0b6e19b7c34d6fb28d173c6c57f857c9636c02c8c0b246a9ca3a370d04cf2b1ca3bc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
