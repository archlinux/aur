# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Frikilinux <frikilinux at gmail.com>
# Contributor: Artem Sereda <overmind88@gmail.com>

pkgname=kde-thumbnailer-apk
pkgver=1.0
pkgrel=3
pkgdesc="Preview image generator plugin for Android Application Package files."
arch=('i686' 'x86_64')
url="https://store.kde.org/p/1081013/"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
source=("${pkgname}-${pkgver}.tar.bz2::https://dl.opendesktop.org/api/files/download/id/1460972065/156421-${pkgname}-${pkgver}.tar.bz2")
sha256sums=('aefb7296a5207e13c4f3624acb6fd3ea359972fbee7f618686f970036067f476')

build() {
  cd $srcdir/$pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DAutomoc4_DIR=/usr/lib/automoc4
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=8 sts=2 sw=2 et:
