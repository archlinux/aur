# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cancerclass
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Development and validation of diagnostic tests from high-dimensional molecular data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-binom
  r-biobase
)
optdepends=(
  r-cancerdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b2e5d6ec200ee08476480fa1f0a1577d')
b2sums=('14bb88564659aec50bd1fff42ded7441f3b277efabf4e3babe644ad10025c2ba2d4b49720606a216d3bf785942d73ec96464f7954886aaa3e53084c3085a4fe3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
