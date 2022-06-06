# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lumiHumanAll.db
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=4
pkgdesc='Illumina Human Illumina expression annotation data (chip lumiHumanAll)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-org.hs.eg.db
)
optdepends=(
  r-annotate
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a2c1bd766e756eb7e01cf196c1809c8a282a4c4caaf1482a0d1961b2c2a8c24e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
