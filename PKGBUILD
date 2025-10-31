# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CopyhelpeR
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Helper files for CopywriteR"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b9f5438729eae6249a8bca92eba497cc')
b2sums=('6883d62711d25bafc54c1567e2ab550a965099ce3aa2598f32eb687326be15a950f5c7251303fdaa9c9460ab4af7f9b790708555c05987630f51c24cdf0c27c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
