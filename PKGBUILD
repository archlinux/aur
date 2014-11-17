# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Trizen <trizenx at gmail dot com>
# Contributor: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=velox-git
pkgver=0.0.2.r242.g5313d92
pkgrel=1
pkgdesc="A simple xcb window manager inspired by awesome, xmonad, and dwm."
arch=('i686' 'x86_64')
url="http://www.ohloh.net/p/velox-wm"
license=('GPL2')
depends=('swc-git')
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
  make PREFIX=/usr
}

package() {
  cd $pkgname
  make PREFIX=/usr LIBEXECDIR=/usr/lib DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
