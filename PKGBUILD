# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_pkgname=lmodel2
_pkgver=1.7-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=11
pkgdesc="Model II Regression"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('95346e8507abb2380049cc4c2ec18b65')
b2sums=('92db86b5d6e55978cc9cda73f29bbdc8158c584128308532708a5eefc191521b4c44ffd1219251bb39f366378ef9a82593759a7bd5fedf8527d0a656eb764588')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
