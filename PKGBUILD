# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=appreci8R
_pkgver=1.20.2
pkgname=r-${_pkgname,,}
pkgver=1.20.2
pkgrel=1
pkgdesc='appreci8R: an R/Bioconductor package for filtering SNVs and short indels with high sensitivity and high PPV'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-biostrings
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-cosmic.67
  r-dt
  r-genomicfeatures
  r-genomicranges
  r-genomicscores
  r-homo.sapiens
  r-iranges
  r-mafdb.1kgenomes.phase3.hs37d5
  r-mafdb.exac.r1.0.hs37d5
  r-mafdb.gnomadex.r2.1.hs37d5
  r-openxlsx
  r-polyphen.hsapiens.dbsnp131
  r-rentrez
  r-rsamtools
  r-rsnps
  r-s4vectors
  r-seqinr
  r-shiny
  r-shinyjs
  r-sift.hsapiens.dbsnp137
  r-snplocs.hsapiens.dbsnp144.grch37
  r-stringr
  r-summarizedexperiment
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-variantannotation
  r-xtrasnplocs.hsapiens.dbsnp144.grch37
)
optdepends=(
  r-go.db
  r-org.hs.eg.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('52003d9e9f3180678d3b09ee28358d42a4834d9128024d63f20b49a2cd332a63')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
