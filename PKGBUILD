# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RSEIS
_pkgver=4.2-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Seismic Time Series Analysis Tools"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rpmg
  r-rwave
)
optdepends=(
  r-geomap
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('42d631c04680746f7b73fabd8a59f4bf')
b2sums=('e84e0e309c783f56563457b2e22004bb7f74eb655f02ffa011a70039c30d8623745caf44e1e13fe5679cbe373ea2bf4e6e1ce801552d75f7c8049865f93db6fe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
