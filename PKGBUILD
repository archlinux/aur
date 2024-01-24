# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=R.filesets
_pkgver=2.15.1
pkgname=r-${_pkgname,,}
pkgver=2.15.1
pkgrel=1
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
sha256sums=('08f5e9269b4f5ffb86f9a369fba792d864240d5f5c02dab435007b53ee989de3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
