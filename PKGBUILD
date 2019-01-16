# Maintainer: cscs <cscs at disroot dot org>

pkgname=musikwave-git
_gitname=musikwavedesktop-master
pkgver=0.1
pkgrel=0
pkgdesc="Desktop MusikWave client using electron"
arch=('x86_64')
url="https://www.musikwave.com"
license=('MIT')
depends=()
makedepends=()
source=(https://gitlab.com/cscs/musikwavedesktop/-/archive/master/musikwavedesktop-master.tar.gz)
md5sums=('SKIP')

build() {
	cd ${_gitname}
}

package() {
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/pixmaps
  install -d ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/share/musikwave
  make -C ${srcdir}/${_gitname} DESTDIR=${pkgdir}/ install
}
