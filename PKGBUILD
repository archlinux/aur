# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=spd
_pkgver=2.0-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Semi Parametric Distribution"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fb9951d399bd2871e7f0d3f5bd96ef29')
b2sums=('b60f706bb7734f6fb98b366f3e07544d68c54df9e3ea84991c6162cbcd6f3bb87654eb7e8ae211e843980ad187cdec76d6b81deee69874b7acb833c5216f7b2a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
