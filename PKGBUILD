# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SBMLR
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SBML-R Interface and Analysis Tools"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-desolve
  r-xml
)
optdepends=(
  r-rsbml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c5005dec45f1cc3d695ddca88e121358')
b2sums=('547bc2a2d9707001eed6a8cd660f7cbae2bee40b6fe711a1a8ef4aa5ba35cd9c9ac7d983796df424cae39e7727862deab8665211f199a4020d960a8a0eed0655')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
