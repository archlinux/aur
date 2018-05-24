# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmclock
pkgver=1.0.16
pkgrel=1
pkgdesc="Dockable clock applet for Window Maker"
arch=('i686' 'x86_64')
url="http://www.dockapps.net/wmclock/"
license=("GPL")
depends=('libxpm')
optdepends=('windowmaker')
source=("https://www.dockapps.net/download/$pkgname-$pkgver.tar.gz")
sha256sums=('3f8bb5df3160d5919d19cf26d45449e6e1260d2a2f485e61f35e64a49639a2d3')

prepare() {
  cd dockapps-*
  autoreconf -fiv
}

build() {
  cd dockapps-*
  ./configure --prefix=/usr
  make V=0
}

package() {
  cd dockapps-*
  make DESTDIR="${pkgdir}" install
  install -Dm644 README "${pkgdir}"/usr/share/doc/wmclock/README
}

