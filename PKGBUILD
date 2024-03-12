# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=easyPubMed
_pkgver=2.13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Search and Retrieve Scientific Publication Records from PubMed"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('80c00e06855791697f4890fa86ce1185')
b2sums=('a1180acc09994ea24d5823dc0fde2ce505ce070815541e4fcd5861bd17b5d75b6846f0a9ca3df8761133f95a5fadbaaf554dc6d82cb1c73ef962b0fb7cd94855')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
