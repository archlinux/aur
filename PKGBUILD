# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-menu
pkgver=0.8
pkgrel=1
pkgdesc="XDG compliant menu generator"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-menu"
groups=('xde')
license=('GPL')
depends=('libwnck' 'libsm' 'gnome-menus')
optdepends=('libwnck+-git: for enhanced functionality'
	    'xdg-launch: for LW WM launch notification'
	    'xde-theme: for LW WM style and theme change support')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('0f58b8f53e8b1e9ccbbebd444a936e1e')

build() {
  cd $pkgname-$pkgver
# CCFLAGS+=" -fPIE"
# LDFLAGS+=" -fPIE -Wl,-pie"
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
