# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-session
pkgver=1.10
pkgrel=2
pkgdesc="X Desktop Environment Display and Session Management"
groups=('xde')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-session"
license=('GPL')
depends=('m4' 'libunique' 'libxvnc' 'xde-theme' 'xde-ctools'
	 'xde-helpers' 'xde-menu' 'xdg-launch' 'numlockx')
makedepends=('xorgproto')
optdepends=('xorg-xdm-xlogin-git: to use xde-xlogin and xde-xchooser')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
sha256sums=('bbaa094f5bb9462082f3157985aacf802d8e74984678c493558a24e979906b44')

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
