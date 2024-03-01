# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gridGraphics
_pkgver=0.5-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=11
pkgdesc="Redraw Base Graphics Using 'grid' Graphics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-magick
  r-pdftools
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ec6a5183d4597929f18ae491b9adecf9')
b2sums=('6ee9cac3e7cfcb8e1b598b14a49fd9521c86995d0d9634c9efd4c1afaf746a50510c74d5d4f9798002333f37cafdf93700022fb9fa15c97376bd70de55f05b0f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
