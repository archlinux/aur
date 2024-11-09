# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=oligo
_pkgver=1.70.0
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
md5sums=('7596c63194f0bf3e58feaa2a854c2061')
b2sums=('862daeda207dbe4b388cbffd373bed268a120a16e9a33694e7c1c54fb12db835322ae8178631c6813ede645d6cb9e7f9b01c38c4f23d4cdfc46fac37572b0d1e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
