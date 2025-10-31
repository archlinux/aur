# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affycomp
_pkgver=1.86.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Graphics Toolbox for Assessment of Affymetrix Expression Measures"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
optdepends=(
  r-affycompdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ff4a5b27813a38986751e4dbd92d7d2a')
b2sums=('eea5ce9caf1bf0eb2c447fbcac295c9180f513a7f410b6957f6f1beb798bedacaa07b8524babc1b4da2928e6b2cb00c8312eb7c751fc38bbc2b4519198beb217')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
