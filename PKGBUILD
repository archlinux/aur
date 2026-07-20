pkgname=librelp
pkgver=1.12.0
pkgrel=1
pkgdesc="The Reliable Event Logging Protocol"
url="https://www.rsyslog.com/librelp/"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('GPL3')
depends=('gnutls')
source=("http://download.rsyslog.com/librelp/librelp-${pkgver}.tar.gz")
sha256sums=('e2e53a9812d06f95d0a311bbfafba78704835de6d7f0ea0fd9c0d94e8eae496a')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
