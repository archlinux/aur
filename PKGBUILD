# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-menu
pkgver=0.10
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
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
md5sums=('c061abcb49594eafe0a185d206b6fcd5')

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
md5sums=('2b53faff0d0aa45b9b12004c8206f4b2')
