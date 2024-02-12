# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dpeak
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="dPeak (Deconvolution of Peaks in ChIP-seq Analysis)"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-bsgenome
  r-iranges
  r-rcpp
)
optdepends=(
  r-bsgenome.ecoli.ncbi.20080805
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7295c2b08b272b157f9345ef6c5a86d3')
b2sums=('c604c9d09b919c0ef46f07e3ef327aaa050b304f60da5da1695783b6b3ecdb406b8ce7baca3e0133d6294df9d7c4e184feaf19ea07b9edfa482927f075bb5b7e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
