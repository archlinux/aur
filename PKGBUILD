# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R.filesets
_pkgver=2.14.0
pkgname=r-${_pkgname,,}
pkgver=2.14.0
pkgrel=4
pkgdesc='Easy Handling of and Access to Files Organized in Structured Directories'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-digest
  r-r.cache
  r-r.methodss3
  r-r.oo
  r-r.utils
)
optdepends=(
  r-gtools
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('707dd7c099aeadbecebbd2ba57e6400405aa44487c641f3729ce06c4c642bb23')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
