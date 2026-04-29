# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cancerclass
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Development and validation of diagnostic tests from high-dimensional molecular data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-binom
  r-biobase
)
optdepends=(
  r-cancerdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2dc94449f8388c32d3817d2272edd534')
b2sums=('2ee2a1692fec78ed94259b641c46fea23687310fc8b65ae00e135a6c262459ad2499a946e1cb6e48629afe2a6390a6cef84a56b15de94312e406fb0329eea560')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
