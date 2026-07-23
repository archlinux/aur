# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeqVarTools
_pkgver=1.50.1
pkgname=r-${_pkgname,,}
pkgver=1.50.1
pkgrel=1
pkgdesc='Tools for variant data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-data.table
  r-gdsfmt
  r-genomicranges
  r-gwasexacthw
  r-iranges
  r-logistf
  r-s4vectors
  r-seqarray
)
optdepends=(
  r-biocstyle
  r-runit
  r-stringr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('20105e8ab61d0ff534f3cdb34e8609cf4646c9d68f255081b7d617ddffe47395')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
