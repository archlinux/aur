# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=adwm
pkgver=0.5.2
pkgrel=3
pkgdesc="Advanced dynamic window manager for X"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/adwm"
license=('GPL')
makedepends=('libxi')
depends=('libxfixes' 'libxft' 'libxrandr' 'libxinerama' 'libxpm' 'startup-notification' 'imlib2')
options=('!libtool')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('8dfc37ab902de66008cb2ee245ce58a3')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
