pkgname=xmltooling
pkgver=3.2.0
pkgrel=0
pkgdesc="Shibboleth Project XML processing library"
url="https://wiki.shibboleth.net/confluence/display/OpenSAML/XMLTooling-C"
license=(Apache)
arch=(x86_64)
depends=(
  curl
  gcc-libs
  'log4shib>=2'
  openssl
  xerces-c
  xml-security-c
  zlib
)
makedepends=(
  boost
  doxygen
)
source=("https://shibboleth.net/downloads/c++-opensaml/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://shibboleth.net/downloads/c++-opensaml/$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('1b53b1a0b25aeb1fa15edcda865540878d8c87fd803bb91aea4aa1491f845c7b'
            'SKIP')
validpgpkeys=('DCAA15007BED9DE690CD9523378B845402277962')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et:
