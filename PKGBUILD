# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=zigg
_pkgver=0.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Lightweight Interfaces to the 'Ziggurat' Pseudo Random Number Generator"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('944be6ebd162bb6fce66496c1a6f063f')
b2sums=('d7c648bde6d6f7d1c0cb3422509de8f12f9e2eb991af14a3f47db9919c588b5beeb2673f673ce3496539d9486f8bb0dc1c23b2b683c70c22bce21105631ee6d7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
