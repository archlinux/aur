# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dgof
_pkgver=1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Discrete Goodness-of-Fit Tests"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d1fd678118c39e29637a68bf298e6e72')
b2sums=('d259f379c0119c340dc5b14ca9a3ef924926e918d470c27e0cda16463d94d75a56a6647dcb78800647cf9958851361172fa9311565706345dd8b691c4ffaedda')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
