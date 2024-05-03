# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ensemblVEP
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Interface to Ensembl Variant Effect Predictor"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-biostrings
  r-genomeinfodb
  r-genomicranges
  r-s4vectors
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8abab1bf8db5de37d2ce9cec4ece66b6')
b2sums=('4f09a2d313ef15516b0b8556ddc5a508b9ce338006eacf88fa9f0653634f026d867c2a08571c7d56f999438c8a5f91a809bc7624c8e5c679a730b0d245024bf0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
