# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ASpli
_pkgver=2.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of Alternative Splicing Using RNA-Seq"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-annotationdbi
  r-biocgenerics
  r-biocstyle
  r-data.table
  r-dt
  r-edger
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-gviz
  r-htmltools
  r-igraph
  r-iranges
  r-limma
  r-pbmcapply
  r-rsamtools
  r-s4vectors
  r-tidyr
  r-txdbmaker
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dd7d018525365556e2ff6f246573d0b0')
b2sums=('91c958d8ab0d232014244de7052c2b5d686f2c80dd6641c013f5a1bbbc41189464e2c5048f356188c2d3dcd47fde712448720b78e7ca1558c446890d4ca3b40f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
