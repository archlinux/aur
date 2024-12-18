# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=atena
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of Transposable Elements"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-biocgenerics
  r-biocparallel
  r-cli
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-matrixgenerics
  r-matrixstats
  r-rsamtools
  r-s4vectors
  r-sparsematrixstats
  r-squarem
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-runit
  r-txdb.dmelanogaster.ucsc.dm6.ensgene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('57c4c4a007244cf697982945cf46e75b')
b2sums=('f8dfbe4b94913c7c8ca4ccf159382df971f9d123e6b07b5317175725cd9fb3deb4fb5f5a79d1df373ea8a79c138bb1f22b070222ade5bd32304cceb2dbd65516')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
