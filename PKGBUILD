# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dupRadar
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Assessment of duplication rates in RNA-Seq datasets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rsubread
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('879bcf1c2da3dd0fd29b22263fc05fb7')
b2sums=('5dbb27a62b6a06588f493020f9cbea955d0baede90d4bff5c24cb6a474de5618f31bbf3c99c2df7205c1500929361c068c20ec00df607b3b8057d708184622d1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
