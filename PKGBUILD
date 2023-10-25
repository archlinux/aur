# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=COHCAP
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="CpG Island Analysis Pipeline for Illumina Methylation Array and Targeted BS-Seq Data"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  perl
  r-bh
  r-cohcapanno
  r-gplots
  r-rcolorbrewer
  r-rcpp
  r-rcpparmadillo
  r-writexls
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6c7c601f8c8aee626d2fa1a6dd306dca')
sha256sums=('cdde22c9ed7ff8e2a433e1f8b917194fbedeb112a4c42b1cefe4369aabacebb3')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
