# system requirements: Unix, Perl (>= 5.6.0), Netpbm
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=webbioc
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=1.74.0
pkgrel=1
pkgdesc='Bioconductor Web Interface'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-annaffy
  r-biobase
  r-biocmanager
  r-gcrma
  r-multtest
  r-qvalue
  r-vsn
  perl
  netpbm
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('feddd843ecc46717a51d6055e0209764026237bd72e1c1f644d7f80e0f0e44b1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
