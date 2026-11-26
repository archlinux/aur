# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MassArray
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analytical Tools for MassArray Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('465a22ac6a1e59f16b020ff719476c6b')
b2sums=('b54fd235891144feb9dab2cab8920788e419b3307a8d1b76f799e73db0059400fc719954fe4e98fcce7d227ccd1cc3fc37419442bcfc6e290dfd8e81853f0fd7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
