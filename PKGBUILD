# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmget
pkgver=0.6.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="dockapp that performs long downloads in background"
url="http://www.dockapps.net/${pkgname}"
license=("GPL")
depends=('libxpm' 'curl')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('f184287754e7bd6d235136c4e986e26d')

prepare() {
  cd dockapps-*
  autoreconf -fiv
}

build() {
  cd dockapps-*
  ./configure --prefix=/usr  --mandir=/usr/share/man
  make V=0
}

package() {
  cd dockapps-*
  make DESTDIR="$pkgdir" install
}

