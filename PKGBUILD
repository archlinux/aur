# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=UniProt.ws
_pkgver=2.36.5
pkgname=r-${_pkgname,,}
pkgver=2.36.5
pkgrel=1
pkgdesc='R Interface to UniProt Web Services'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biocfilecache
  r-biocgenerics
  r-rappdirs
  r-rcurl
  r-rsqlite
  r-httpcache
  r-cellxgenedp
  r-progress

)
optdepends=(
  r-biocstyle
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b639268dca44676b57f7275c92e46e8dcfb110e24dec2dbbc7ba5dc2b96bbce0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
