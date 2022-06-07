# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BrainStars
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='query gene expression data and plots from BrainStars'
arch=('any')
url="https://bioconductor.org/packages/3.12/bioc/html/${_pkgname}.html"
license=('Artistic2.0')
depends=(
  r
  r-rcurl
  r-biobase
  r-rjsonio
)
makedepends=(
  git
  tar
)
source=("git+https://git.bioconductor.org/packages/${_pkgname}.git")
sha256sums=('SKIP')

build() {
  tar -zcvf ${_pkgname}.tar.gz  ${_pkgname}
  R CMD INSTALL ${_pkgname}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:

