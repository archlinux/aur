# Maintainer: archlinux.info:tdy

pkgname=ggobi
pkgver=2.1.11
pkgrel=1
pkgdesc="A visualization program for exploring high-dimensional data"
arch=(i686 x86_64)
url=http://www.ggobi.org
license=(CPL)
depends=(gtk2 graphviz)
options=(libtool)
source=(http://www.$pkgname.org/downloads/$pkgname-$pkgver.tar.bz2)
sha256sums=(2c4ddc3ab71877ba184523e47b0637526e6f3701bd9afb6472e6dfc25646aed7)

build() {
  cd $pkgname-$pkgver
  ./configure --with-all-plugins --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
