# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=COHCAP
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('7c6563694a4c95720c88bcc4df639f28')
sha256sums=('caa2bdc18d51ba9a66bd9168627d425a57ccc3521de813548f63d60a583043e7')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
