# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=garfield
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="GWAS Analysis of Regulatory or Functional Information Enrichment with LD correction"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5ed9866ae0522a9c2741de17f6f42da2')
b2sums=('210fd7fe8966a70a1fb93143c70af3405eb7526e69b4e2d55d6519f47c43e1e586bf4b9dcce75d4803c075b33d569053d78ce680e271738b061236d221e2c84f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
