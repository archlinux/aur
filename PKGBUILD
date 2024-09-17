# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=separationplot
_pkgver=1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Separation Plots"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-hmisc
  r-rcolorbrewer
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4485e15bd560d1b981ec28077ffd28fa')
b2sums=('22b3d8f97a9efb159440bab035b7a54e673a485ad07b7c95b4a68757d2b7d710b5d28bb677515227ca3be82facaa8773465b07de8d919876d4362322d7e69b29')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
