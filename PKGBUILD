# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=egg
_cranver=0.4.5
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Extensions for 'ggplot2': Custom Geom, Custom Themes, Plot Alignment, Labelled Panels, Symmetric Scales, and Fixed Panel Size"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=(r 'r-gridextra>=2.3' r-ggplot2 r-gtable)
optdepends=(r-knitr r-png)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('15c8ba7cf2676eb0460de7e5dfbc89fc3175ac22a8869cfd44d66d156fd6c7bb')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
