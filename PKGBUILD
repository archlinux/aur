# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oligo
_pkgver=1.68.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Preprocessing tools for oligonucleotide arrays"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-affxparser
  r-affyio
  r-biobase
  r-biocgenerics
  r-biostrings
  r-dbi
  r-ff
  r-oligoclasses
  r-preprocesscore
  r-rsqlite
  r-zlibbioc
  zlib
)
optdepends=(
  r-acme
  r-annotationdbi
  r-biocstyle
  r-biomart
  r-bsgenome.hsapiens.ucsc.hg18
  r-genefilter
  r-hapmap100kxba
  r-knitr
  r-limma
  r-maqcexpression4plex
  r-oligodata
  r-pd.hg.u95av2
  r-pd.hg18.60mer.expr
  r-pd.huex.1.0.st.v2
  r-pd.hugene.1.0.st.v1
  r-pd.mapping50k.xba240
  r-rcolorbrewer
  r-rcurl
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e492eca257a1dd6945d05816833cf617')
b2sums=('367d4ff12bef4dee4fbc9c92c96ec299df46f11e7467c0f29fd7a695e1a841bc9a3021a7c9987223986d262085579615621a8e9612f0de3c16f71814bc1c11e9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
