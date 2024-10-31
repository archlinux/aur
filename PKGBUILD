# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MVCClass
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Model-View-Controller (MVC) Classes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a8ce7fca6f05d4da5d4025891e82c51c')
b2sums=('411d6784c90f96fb7b37c4c4a4b58bd2a100ad060f52b78cfa22fb5a67bc516f887a831d1280eb7cf72112703d85435a918f4bb357062e35ac50aedacf6b58c7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
