# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MafDb.1Kgenomes.phase3.hs37d5
_pkgver=3.10.0
pkgname=r-${_pkgname,,}
pkgver=3.10.0
pkgrel=3
pkgdesc='Minor allele frequency data from 1000 Genomes Phase 3 for hs37d5'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-bsgenome
  r-genomeinfodb
  r-genomicranges
  r-genomicscores
  r-iranges
  r-s4vectors
)
optdepends=(
  r-snplocs.hsapiens.dbsnp144.grch37
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0d997b1985eaaed3954d314dee3d7e2ef4423615464c8ab5fb7add35fceb4bb0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
