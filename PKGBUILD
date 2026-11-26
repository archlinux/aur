pkgname=librelp
pkgver=1.14.0
pkgrel=1
pkgdesc="The Reliable Event Logging Protocol"
url="https://www.rsyslog.com/librelp/"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('GPL-3.0-only')
depends=('gnutls')
makedepends=('autoconf')
source=("librelp-$pkgver.tar.gz::https://github.com/rsyslog/librelp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2ed401478d96915c01555036cb45609d27fc67747deffad32136315c48626e13')

build() {
  cd "${pkgname}-${pkgver}"
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
