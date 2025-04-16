# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tkWidgets
_pkgver=1.86.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R based tk widgets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-dyndoc
  r-widgettools
)
optdepends=(
  r-biobase
  r-hgu95av2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0d6698a23a7aba3ad5bfff5dbda02d73')
b2sums=('6c0aa97ebfbdb36fb1e67672f4f23334c0aebd2036480843709dd3460a8cb71c1b59b68817d6efa0a9e22707a6e55448b870ca16c40b46a3bbff697f32e5d047')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
