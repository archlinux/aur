# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fftw
_pkgver=1.0-8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Fast FFT and DCT Based on the FFTW Library"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  fftw
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7616d850e0f1256f89031b7f2c5a592c')
b2sums=('358db964164685261dec6b4ed8e856775d2f4b5fbd16ef8316f1a0076ea1dcfe4a69b393de6d370cce36762eab4dd2cab2eadb2f071e5301fcabb2819c21a59f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
