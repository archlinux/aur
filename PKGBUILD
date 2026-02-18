# Maintainer: J. T. Atria <jtatria at gmail dot com>

_pkgname=lavaanExtra
_pkgver=0.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Convenience Functions for Package 'lavaan'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-lavaan
  r-insight
)
optdepends=(
  #r-rempsyc
  r-flextable
  #r-lavaanplot
  r-diagrammersvg
  r-rvsg
  r-png
  r-webshot
  #r-tidysem
  r-tmvnsim
  r-knitr
  r-tibble
  r-sjlabelled
  r-stringdist
  r-psych
  r-testthat
  r-rmarkdown
  r-markdown
  r-covr
  r-spelling
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d518fe5c929b9c338f902fb2a3401a50')
b2sums=('1629496ca63085763527a62235a4e61758742137a62c453ebdf932ed1b1d28b69afd8f0f8bc7d34e275cb9111ccd1dae3c157aee57f5122340d716db3664fa25')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
