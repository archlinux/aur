# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RTriangle
_pkgver=1.6-0.10
pkgname=r-${_pkgname,,}
pkgver=1.6.0.10
pkgrel=4
pkgdesc='Triangle - A 2D Quality Mesh Generator and Delaunay Triangulator'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('CCPL:by-nc-sa')
depends=(
  r
)
optdepends=(
  r-geometry
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0da6cbc9d2b06efdaade3307ca05c5546bd2b869ea71fcb21271945d5f49ca1f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
