# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mapplots
_pkgver=1.5.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Data Visualisation on Maps"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-shapefiles
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d376f1fa68dd004de1fa49bf1146e465')
b2sums=('bd796d85ec69f5569fc2a4515b00c596738e988fb70eef5d93ae9aa1aaf30a6881232f58e6df30a1b40f06af1c350db8416578d97ce54f67f25d22973d30774c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
