# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stringdist
_pkgver=0.9.17
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Approximate String Matching, Fuzzy Text Search, and String Distance Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('45b2d8cdf50b9bdee705207a180deea1')
b2sums=('64623b88519b84dec12efcfaa239c6f20f64c1bac7310ef2a3cf2b810694ca3ae63b76773edd889cbbd87a43fc7e068d75933724377f5a5db85e74a05fa2a693')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
