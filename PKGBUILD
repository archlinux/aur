# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gridSVG
_pkgver=1.7-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Export 'grid' Graphics as SVG"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-jsonlite
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0afec3a238e9b37603db6b2feade8fd2')
b2sums=('70328900a7790ecaf4e3cf45bcc3791b23a4b207ec60c5a902081e1976b814e2258f6ec6ac53dabc350d55e2dfd0a1e3b021bdb4e6107d3f41d70ada59b2cb7c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
