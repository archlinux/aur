# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-menu
pkgver=0.6
pkgrel=1
pkgdesc="XDG compliant menu generator"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-menu"
license=('GPL')
depends=('libwnck' 'libsm' 'gnome-menus')
optdepends=('libwnck+-git: for enhanced functionality'
	    'xdg-launch: for LW WM launch notification'
	    'xde-theme: for LW WM style and theme change support')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('c89ce039818958af17bbfb69d1645af7')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
