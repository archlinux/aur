# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gcspikelite
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spike-in data for GC/MS data and methods within flagme"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bb62c3254217cf645b06cbf693cfa280')
b2sums=('5fa86d2a9f884991a55ab785fd917fbd9c9d8d30c650bbba673902c2bc7ea28db4daf6fdfd1339769f276da50a780d8509aa6203a5cfee43f59621c46f1c45ca')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
