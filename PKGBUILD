# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SMAP
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=1.60.0
pkgrel=1
pkgdesc='A Segmental Maximum A Posteriori Approach to Array-CGH Copy Number Profiling'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('87fceae4dee4af82276e6174ff3fb1b7e1790d9db9134f6cfb6ba43d515e8085')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
