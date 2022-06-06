# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RmiR
_pkgver=1.49.0
pkgname=r-${_pkgname,,}
pkgver=1.49.0
pkgrel=3
pkgdesc='Package to work with miRNAs and miRNA targets with R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-dbi
  r-rmir.hs.mirna
  r-rsvgtipsdevice
)
optdepends=(
  r-hgug4112a.db
  r-org.hs.eg.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4ad28fb669731a44e39bde01b440a30c752a8aee0204472a8b7ee3931481dc9a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
