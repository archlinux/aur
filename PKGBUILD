# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sendmailR
_pkgver=1.4-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Send Email Using R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-base64enc
)
optdepends=(
  r-curl
  r-htmltools
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b8a5eccd3a787dad249d81e192d46c05')
b2sums=('5b47be00752b87fe17f3bf701b8606792d9360ec55661973f188536657f28989bdad84a8eca8f68ec767abb2406ff085d9b0368e8928e6947b4e54cb4a517dd5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
