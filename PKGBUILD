# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oligo
_pkgver=1.68.1
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
md5sums=('3644a5338715b6359e56c51b1ef4b33e')
b2sums=('7ddb336bdfd2b330c88f4cba379b73e5dca87f1e97d4643350243c1df4b07f81b8ff3503b0072394ed63bd12378a9508b9e603f2e5b87798f4528a3c9aba5aa9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
