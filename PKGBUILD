# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=missMethyl
_pkgver=1.32.1
pkgname=r-${_pkgname,,}
pkgver=1.32.1
pkgrel=1
pkgdesc='Analysing Illumina HumanMethylation BeadChip Data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biasedurn
  r-biobase
  r-biocgenerics
  r-genomicranges
  r-go.db
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylation450kmanifest
  r-illuminahumanmethylationepicanno.ilm10b4.hg19
  r-illuminahumanmethylationepicmanifest
  r-iranges
  r-limma
  r-methylumi
  r-minfi
  r-org.hs.eg.db
  r-ruv
  r-s4vectors
  r-statmod
  r-stringr
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-dmrcate
  r-edger
  r-experimenthub
  r-knitr
  r-minfidata
  r-rmarkdown
  r-tweedeseqcountdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('aa3aa9fae9fb7ea77691f67d90485d702b8a79a625d2c603cf53be894c4535e7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
