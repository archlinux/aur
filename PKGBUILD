# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-session
pkgver=1.4
pkgrel=1
pkgdesc="X Desktop Environment Display and Session Management"
groups=('xde')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-session"
license=('GPL')
depends=('m4' 'libunique' 'libxss' 'libxvnc' 'xde-theme' 'xde-ctools'
	 'xde-helpers' 'xde-menu' 'xdg-launch')
optdepends=('xorg-xdm-xlogin-git: to use xde-xlogin and xde-xchooser')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('bf71087acc6a00b114ed431a4ccbc138')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
