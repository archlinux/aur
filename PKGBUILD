# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>
# Contributor: ava1ar <mail@ava1ar.info>
# Maintainer: ranger <ranger.linux@gmail.com>

pkgname=kdeplasma-applets-networkmanagement
epoch=1
pkgver=0.9.0.12
pkgrel=1
pkgdesc="KDE control panel and widget network connections"
arch=('i686' 'x86_64')
#groups=('archlinuxgr-plasmoids')
url='https://projects.kde.org/projects/extragear/base/networkmanagement'
license=('GPL')
depends=('kdebase-workspace>=4.11.0' 'networkmanager')
conflicts=('kdeplasma-applets-plasma-nm')
makedepends=('cmake' 'python2' 'automoc4')
optdepends=('mobile-broadband-provider-info: Database of mobile broadband service providers'
            'openconnect: Cisco AnyConnect compatible VPN client')
install=${pkgname}.install
source=("http://download.kde.org/unstable/networkmanagement/${pkgver}/src/networkmanagement-${pkgver}.tar.xz")


build() {
  rm -rf build && mkdir build
  cd build
  cmake ../networkmanagement-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
md5sums=('3a2b0b8f3545727cf0ded82e82a936b8')
