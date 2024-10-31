# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=vbmp
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Variational Bayesian Multinomial Probit Regression"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biobase
  r-statmod
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8e3b858522daf1a1e68a7aad26421977')
b2sums=('2ce632254302a30a04de92e5021ae5a5808c027b22e5f3aff3010eae923e4b6d408b06ba7b430dd1504b7d50a1f689c2f65c3e70dff1626743c5917ef55b953a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
