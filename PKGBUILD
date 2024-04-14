# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ALL
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A data package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b80eb482b4937ef4eac01027ac95a61a')
b2sums=('0af64b306d65d415c302ad1e015dbc1b6e54ace2d2ed9b16196f095be7b6ead179d876c46dee1ea210f75dc152dfb59f567c4c1a4305dac180f06ad30871ceed')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
