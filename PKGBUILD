# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fftw
_pkgver=1.0-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast FFT and DCT Based on the FFTW Library"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  fftw
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('510589e319a50c91d4ee0386b7ad74bc')
b2sums=('7a761f1b50d44dfaf2c1ad7dc1847718524ca4797cceba3d240497500d06da456665007aebd8bf1ac423a54ba896f2c7a6512a324ef7a9d83a937176e27f9ede')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
