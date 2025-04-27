# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mygene
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Access MyGene.Info_ services"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-genomicfeatures
  r-hmisc
  r-httr
  r-jsonlite
  r-plyr
  r-s4vectors
  r-sqldf
  r-txdbmaker
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c9759e4864a1cabda263352751f6a7b9')
b2sums=('1d6ff119736e2f71629fc32ad3462432fb3f13d382d95006e7f75a1fefb6e942c97466dc9a4b436f048f33fd95fde57cac6c73d37d57209cda79d7c44b7fa982')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
