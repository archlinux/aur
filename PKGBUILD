# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rafalib
_pkgver=1.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Convenience Functions for Routine Data Exploration"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocmanager
  r-rcolorbrewer
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1f768fc8cff6fa7ef3fc5152923f05c3')
b2sums=('30f0988222f138031204a535c17635e5b0ff54d785c7dddab16887f82b1a16c5d0bd2a444cb017ae78997c3e8958801069e37fbed12c28ad0a902dc0d8f58fde')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
