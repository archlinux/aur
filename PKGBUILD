# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=awsMethods
_pkgver=1.1-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Class and Methods Definitions for Packages 'aws', 'adimpro', 'fmri', 'dwi'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2a9265bc79c127c7a5c153bcefae6948')
b2sums=('eabe1e977c8e6b8a5fdf64c875b288a16efa3c6948c79f62b65d039f8d72a85f4b9607c9803863b83ae196beee5277f3787f533c28548e1380941d63974b392a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
