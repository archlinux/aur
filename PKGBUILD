# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multtest
_pkgver=2.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Resampling-based multiple hypothesis testing"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-biobase
  r-biocgenerics
)
optdepends=(
  r-snow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ea043ffe972fb0592853ebe0496666c9')
b2sums=('578f484cc5eff4c66d92819c023e125d7d276587bb9b8f4570a040b13e2f6f96e34fabc8f31007095bc18d584aba82eb4fad6eb92b0e5c411b9020a28b088a27')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
