pkgname=librelp
pkgver=1.6.0
pkgrel=1
pkgdesc="The Reliable Event Logging Protocol"
url="https://www.rsyslog.com/librelp/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gnutls')
source=("http://download.rsyslog.com/librelp/librelp-${pkgver}.tar.gz")
sha256sums=('cf6cc948a5b3d1e56b3251585c11beea1c5b285fcbf8e29ad68955c7eb75f8ca')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
