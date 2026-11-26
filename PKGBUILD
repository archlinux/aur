# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=daMA
_pkgver=1.86.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Efficient design and analysis of factorial two-colour microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('624dde4d720322e2f2d5c4e5458c3ae8')
b2sums=('f93ad249071635b776f09a2683db48bdedcfdf11851cfd46b6a35b292f5cda0073999bd4520a17433e3084548479d894c9d9f7c3ed22f066d62a0ea733230e54')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
