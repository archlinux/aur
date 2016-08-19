# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Feufochmar <feufochmar@d-20.fr>
pkgname=wmwifi
pkgver=0.6
pkgrel=5
pkgdesc="A wireless network interface monitor dockapp for Window Maker"
arch=('i686' 'x86_64')
url="http://www.dockapps.net/$pkgname"
license=('GPL')
depends=('libxpm')
source=("http://www.dockapps.net/download/$pkgname-$pkgver.tar.gz")
md5sums=('b170d4a6c4fc42774b9798cf98af1c27')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make V=0
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
