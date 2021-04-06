pkgname=librelp
pkgver=1.10.0
pkgrel=1
pkgdesc="The Reliable Event Logging Protocol"
url="https://www.rsyslog.com/librelp/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gnutls')
source=("http://download.rsyslog.com/librelp/librelp-${pkgver}.tar.gz")
sha256sums=('148db4e4d1a23e8136e9ec08810929a55faf5d45e24c2e3186d5ab34355dab31')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
