pkgname=liblogging
pkgver=1.0.8
pkgrel=1
pkgdesc="easy to use, portable, open source library for system logging"
url="http://www.liblogging.org/"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('GPL')
depends=('systemd')
makedepends=('python-docutils')
options=('strip' 'zipman' '!libtool')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rsyslog/liblogging/archive/v$pkgver.tar.gz")
sha256sums=('5b599cba49dc1010d937e65481d728c8be177e9b8c6bb9eacc5d5c1488febb04')

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
