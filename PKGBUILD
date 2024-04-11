# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dir.expiry
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('ddefb728416ca4283805e19a898e9245')
b2sums=('2422cfedd7808d6300f9e5039777ecf79e6210dfaeb11c4f147db005b5510a663fd1fcf2b71d1a86cf5066e19fc78d9ff3584c47f3d08d77b005ecb64ba1e3d0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
