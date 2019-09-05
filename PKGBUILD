# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-theme
pkgver=1.3
pkgrel=1
pkgdesc="Theme and style setting utilities for the X Desktop Environment (XDE)"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/xde-theme"
groups=('xde')
license=('GPL3')
depends=('libxinerama' 'gdk-pixbuf2' 'libxrandr' 'libsm' 'imlib2')
optdepends=('xde-styles: for styles that work with xde-style')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('55564c9ca5d11d7b4843e1a75cb576f65b91f4e9a99672accebed6fd1b42ae10')

build() {
 cd $pkgname-$pkgver
 ./configure
 make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim: et sw=2:
