# system requirements: pandoc (>= 1.12.3)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=prettydoc
_pkgver=0.4.1
pkgname=r-${_pkgname,,}
pkgver=0.4.1
pkgrel=4
pkgdesc='Creating Pretty Documents from R Markdown'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-rmarkdown
  pandoc
)
optdepends=(
  r-kernsmooth
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1094a69b026238d149435472b4f41c75151c7370a1be6c6332147c88ad4c4829')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
