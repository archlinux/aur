# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-ctools
pkgver=1.5
pkgrel=1
pkgdesc="X Desktop Environment C-language tools"
groups=('xde')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-ctools"
license=('GPL')
depends=('libxss' 'libxxf86misc' 'libsm' 'libwnck+')
makedepends=('dbus-glib' 'libunique')
optdepends=('xdg-launch: launch with recent update and launch notification')
source=("https://github.com/bbidulock/xde-ctools/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('a4a97f09d91bfe7cca8f011fa9f7e6d1')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
