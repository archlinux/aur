# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iClusterPlus
_pkgver=1.36.1
pkgname=r-${_pkgname,,}
pkgver=1.36.1
pkgrel=1
pkgdesc='Integrative clustering of multi-type genomic data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-runit
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a372439bddb5c45ff34538c7f81807b7728b7db4de655eeff769ce9b6cac73d1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
