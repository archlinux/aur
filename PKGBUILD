pkgname=liblogging
pkgver=1.0.6
pkgrel=3
pkgdesc="easy to use, portable, open source library for system logging"
url="http://www.liblogging.org/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('systemd')
makedepends=('python-docutils')
options=('strip' 'zipman' '!libtool')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rsyslog/liblogging/archive/v$pkgver.tar.gz")
sha256sums=('5d235b7da35329d7d13349a4b941a197506a3c47bf8c27758c5e56b51c142c58')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make install DESTDIR="$pkgdir"
}
