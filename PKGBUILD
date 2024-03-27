# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=daMA
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Efficient design and analysis of factorial two-colour microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ec7e80e81b9d6eb5a76ce06c761bb7da')
b2sums=('53865c072c351452cb9439d2b3d995445a703d28c7d340453fe1e5199cff078cc7a322db5d9c1512fa0b58b07c27cd113d4e33fc01d4b676adf562e3186b8770')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
