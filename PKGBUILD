# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cnvGSA
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=1.40.0
pkgrel=1
pkgdesc='Gene Set Analysis of (Rare) Copy Number Variants'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('LGPL')
depends=(
  r
  r-brglm
  r-doparallel
  r-foreach
  r-genomicranges
  r-splitstackshape
)
optdepends=(
  r-cnvgsadata
  r-org.hs.eg.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4c4fbd7580a7284b78b9b5d0d8ca2bf9051033afd554759e2b793c1285b17373')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
