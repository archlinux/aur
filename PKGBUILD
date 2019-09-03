# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-desktop
pkgver=0.4
pkgrel=1
pkgdesc="X Desktop Environment desktop"
groups=('xde')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-desktop"
license=('GPL')
depends=('libxss' 'libxxf86misc' 'libsm' 'libunique' 'libwnck+-git' 'gnome-vfs')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
md5sums=('e244c28e181218cc431943781f7ff48c')

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
