# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=BART
_pkgver=2.9.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bayesian Additive Regression Trees"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rcpp
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-rpart.plot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b4edb44c2111194cbd7f57268b1fb9d4')
b2sums=('79e873421fdc3b53dd0ff6f5c78c77759ed69eac2435a9c1a3c78f60d0725a919f872dd1a90e2173a4e44d595f70b5b3667ac4a02113de1c15a682beae80172b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
