# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=lisrelToR
_pkgver=0.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Import Output from LISREL into R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('23515b702dfcfbf8e2b1284f2d908cda')
b2sums=('a71f03f3500c4aa08301d36b05badfd3dd58dfa7242977628b4a3e42ec0c6c87c29963b7a52f7d48eca9c3472b67e01b5c624376aaab05a11763d151fad9c94f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
