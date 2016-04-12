# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=yabar-git
_pkgname=yabar
pkgver=0.4.0.r6.ge404003
pkgrel=1
pkgdesc="A modern and lightweight status bar for X window managers"
arch=('i686' 'x86_64')
url="https://github.com/geommer/yabar"
license=('MIT')
depends=('pango' 'libconfig' 'xcb-util-wm' 'gdk-pixbuf2')
makedepends=('git')
provides=('yabar')
conflicts=('yabar')
source=(git://github.com/geommer/yabar.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname

  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install
}
