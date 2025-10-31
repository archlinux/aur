# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BAGS
_pkgver=2.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Bayesian Approach for Geneset Selection"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-breastcancervdx
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8b4495813d2b53e9fbd50ffae5e8ce24')
b2sums=('f6d4b67087e265fb3e50255f0a764bde87d63136137881354d8a2de771f20859a0c98621e9312ec79871c1954929f7bb5f110ba85f1892bd2ea231ad01acf3e5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
