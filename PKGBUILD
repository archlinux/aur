# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-session
pkgver=1.3
pkgrel=1
pkgdesc="X Desktop Environment Display and Session Management"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-session"
license=('GPL')
depends=('m4' 'libunique' 'libxss' 'libxvnc' 'libxxf86misc' 'dbus-glib' 'xde-theme' 'xde-ctools' 'xde-helpers')
optdepends=('xorg-xdm-xlogin-git: to use xde-xlogin and xde-xchooser')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('70e0613e7537f9d117e9ce762fbd5068')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
