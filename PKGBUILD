# Maintainer: zoe <chp321 at gmail dot com>

pkgname=sportstracker-bin
_pkgname=sportstracker
pkgver=7.1.0
pkgrel=1
pkgdesc="Application for people which want to record their sporting activities ; stand-alone version with its own java"
url="http://www.saring.de/sportstracker/"
arch=('x86_64')
license=('GPL')
makedepends=('tar')
provides=(sportstracker)
conflicts=(sportstracker)
source=("http://freefr.dl.sourceforge.net/project/${_pkgname}/SportsTracker/SportsTracker%20${pkgver}/Ubuntu-64bit/${_pkgname}-${pkgver}.deb")
md5sums=('3307b8e528bc27f7a1b26643a0436db8')

package() {
  cd $srcdir
  ar x "${_pkgname}-${pkgver}.deb"
  tar xvf data.tar.xz
  cp -rp opt $pkgdir
  mkdir -p $pkgdir/usr/share/applications
  cd $pkgdir
  mv opt/SportsTracker/SportsTracker.desktop usr/share/applications/
}