# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yeastCC
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Spellman et al. (1998) and Pramila/Breeden (2006) yeast cell cycle microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('847d9bba73cb25f458f608c2cd6bf0e8')
b2sums=('f2574ad0b67f157d99f0bad836090e191b01edf6bf6e3646b87a2a152b4e2952fcdbab1669aed9f89fa4c9afc1de286f90e04c30452ccdf15c0a64f1a9533dd9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
