# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=print-manager-kde4
pkgver=4.14.3
pkgrel=1
pkgdesc="A tool for managing print jobs and printers"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdeutils/print-manager'
license=('GPL' 'LGPL' 'FDL')
depends=('kdebase-workspace' 'libcups')
makedepends=('cmake' 'automoc4')
optdepends=('system-config-printer: auto-detect the printer driver')
replaces=('kdeutils-print-manager' 'print-manager' 'kdeutils-printer-applet' 'kdeadmin-system-config-printer-kde')
conflicts=('kdeutils-print-manager' 'print-manager' )
groups=('kdeutils')
source=("print-manager-${pkgver}.tar.xz::http://download.kde.org/stable/${pkgver}/src/print-manager-${pkgver}.tar.xz")
sha256sums=('081736f273c7f13806828497caddf83d36d5e083d56b277dc363360614fbc135')


build() {
  mkdir build
  cd build
  cmake ../print-manager-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
