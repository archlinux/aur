pkgname=wmshutdown
pkgdesc="a dockapp for shutting down your machine"
pkgver=1.4
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.dockapps.net/$pkgname"
license=("GPL")
depends=('libxpm')
source=("http://www.dockapps.net/download/$pkgname-$pkgver.tar.gz")
md5sums=('a0297f89e100464ed54d2f41a7af69a2')

prepare() {
   cd dockapps-*
   autoreconf -fiv
}

build() {
   cd dockapps-*
   ./configure --prefix=/usr --mandir=/usr/share/man
   make V=0
}

package() {
   cd dockapps-*
   make DESTDIR="$pkgdir" install
}
