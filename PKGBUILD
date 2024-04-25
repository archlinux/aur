# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alphahull
_pkgver=2.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Generalization of the Convex Hull of a Sample of Points in the Plane"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-ggplot2
  r-interp
  r-r.utils
  r-sgeostat
  r-spatstat.geom
  r-spatstat.random
  r-splancs
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1ea4cc665f6cde31c63cc9e50a6c801f')
b2sums=('ed8f9c06843683039b34d90e3c45613f60e49deeb5a16efecb58032a67e7b019ba4e9f10b831585f312c854eb54f5ede644182783992309d36f308eeb4a86f7f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
