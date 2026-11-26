# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BufferedMatrixMethods
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Microarray Data related methods that utlize BufferedMatrix objects"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-bufferedmatrix
)
optdepends=(
  r-affy
  r-affyio
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('abad337dc8fcc3ef02f0ddeca01b14f7')
b2sums=('0d672882500d2101e1b46df97cec7e24dde4e021cb474edd579e70d9645c4889770dc8a1dcb582db1ae9f2e940c781a0c15177d872f4db5b74084b565ff4c666')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
