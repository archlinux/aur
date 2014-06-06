# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Trizen <trizenx at gmail dot com>
# Contributor: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=velox-git
pkgver=0.0.2.r203.g882271d
pkgrel=2
pkgdesc="A simple xcb window manager inspired by awesome, xmonad, and dwm."
arch=('i686' 'x86_64')
url="http://www.ohloh.net/p/velox-wm"
license=('GPL2')
depends=('libpulse' 'libxkbcommon' 'libyaml' 'libmpdclient')
conflicts=('velox')
provides=('velox')
source=("$pkgname::git+https://github.com/michaelforney/velox.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
