# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MultiMed
_pkgver=2.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Testing multiple biological mediators simultaneously"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9ed20fe1494ea3fd3b6e3c2fbb12d003')
b2sums=('54555668ba831c8ca35503dcf2e18cb8a593cc7f40e99132ea3f8dc39f6016beb251373f78c81d2e564027c0107e12ac2b9d43b2c54c03c2f107de8388492740')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
