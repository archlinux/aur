# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-ctools
pkgver=1.6
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
md5sums=('abff13d2a7dd30bd4df172e960e81c2e')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
