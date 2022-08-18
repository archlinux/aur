# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmpi
_pkgver=0.6-9.2
pkgname=r-${_pkgname,,}
pkgver=0.6.9.2
pkgrel=4
pkgdesc='Interface (Wrapper) to MPI (Message-Passing Interface)'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  openmpi
)
makedepends=(
  openssh
  inetutils
  nvidia-utils
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('358ac1af97402e676f209261a231f36a35e60f0301edf8ca53dac11af3c3bd1a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
