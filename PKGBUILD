# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-menu
pkgver=0.11
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
sha256sums=('bc31203e1f554d905abb90eb5c1da341b94e5009a87bb947ffdcee7b791ed849')

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
