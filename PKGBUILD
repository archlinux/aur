# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DrugVsDiseasedata
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Drug versus Disease Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4ff15eb988c1a25432ee7d10eba06b1b')
b2sums=('863cdc9d0f4908b117366445e62d869aed6a15cf9c4794c41f7ed7bb98555c6a3097cd36284287fb6268d8fc2bb1c0eee053473509259d03eaa611eb55d4e217')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
