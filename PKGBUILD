# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NLP
_pkgver=0.2-1
pkgname=r-${_pkgname,,}
pkgver=0.2.1
pkgrel=4
pkgdesc='Natural Language Processing Infrastructure'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-cleannlp
  r-spacyr
  r-udpipe
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('05eaa453ad2757311c073fd30093c738b20a977c5089031eb454345a1d01f2b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
