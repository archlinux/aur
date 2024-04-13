# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRmine
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data package with miRNA-seq datasets from miRmine database as RangedSummarizedExperiment"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-deseq2
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a49fb63deed3bc3361263701c8f1ae52')
b2sums=('7a504c61be16e867aecb67976bcd2e8c895dcd2f3c155990a7387402969db9bbb759dfcaaf75f19621aa9a628f0b51e3f14fd06cb7254f45be0cf7d690e47898')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
