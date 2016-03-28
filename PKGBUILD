# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-menu
pkgver=0.2
pkgrel=1
pkgdesc="XDG compliant menu generator"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-menu"
license=('GPL')
depends=('libunique' 'libwnck' 'libsm' 'gnome-menus' 'gtk2')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('4b1cccab3987f947cb3df60db9de8597')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
