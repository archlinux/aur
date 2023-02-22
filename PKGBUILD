# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=isa2
_pkgver=0.3.6
pkgname=r-${_pkgname,,}
pkgver=0.3.6
pkgrel=1
pkgdesc='The Iterative Signature Algorithm'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
)
optdepends=(
  r-biclust
  r-igraph
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6256da84dd9a10499f802838c2065ee6e4dcc012b07d21116496ff8aebb65c66')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
