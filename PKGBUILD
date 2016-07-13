# $Id: PKGBUILD 271693 2016-07-12 18:16:03Z arojas $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
_pkgname=zeroconf-ioslave
pkgname=kio-zeroconf-git
pkgver=16.04.3
pkgrel=1
pkgdesc='Network Monitor for DNS-SD services (Zeroconf)'
url='https://www.kde.org/applications/internet/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kio' 'kdnssd')
group=('kf5')
makedepends=('extra-cmake-modules')
conflicts=('kdenetwork-kdnssd')
source=("git://anongit.kde.org/$_pkgname#branch=frameworks")
sha1sums=('SKIP')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../zeroconf-ioslave \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
