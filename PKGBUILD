# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metaseqR2
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for the analysis and result reporting of RNA-Seq data by combining multiple statistical algorithms"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-absseq
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biomart
  r-biostrings
  r-corrplot
  r-deseq2
  r-dss
  r-dt
  r-edaseq
  r-edger
  r-genefilter
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-gplots
  r-harmonicmeanp
  r-heatmaply
  r-htmltools
  r-httr
  r-iranges
  r-jsonlite
  r-limma
  r-locfit
  r-log4r
  r-magrittr
  r-nbpseq
  r-pander
  r-qvalue
  r-rmarkdown
  r-rmdformats
  r-rsamtools
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-survcomp
  r-txdbmaker
  r-venndiagram
  r-vsn
  r-yaml
  r-zoo
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-bsgenome
  r-knitr
  r-rmysql
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('63be3ca96bdfbeb4262124fe5f8fa4a2')
b2sums=('a6ef873e0396a35aac18e2f7cdf91f68798f54f77aea0e0a3892e54025692ed6235a77af03fc92f7fe25f7176934b816ea9011e6ea7694ac2325c31839d15917')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
