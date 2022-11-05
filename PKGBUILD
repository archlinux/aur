pkgname=xmltooling
pkgver=3.2.2
pkgrel=2
pkgdesc="Shibboleth Project's XML processing library"
url="https://wiki.shibboleth.net/confluence/display/OpenSAML/XMLTooling-C"
license=(Apache)
arch=(x86_64)
depends=(
  curl
  gcc-libs
  log4shib
  openssl
  xerces-c
  xml-security-c
  zlib
)
makedepends=(
  boost
  doxygen
)
source=("https://shibboleth.net/downloads/c++-opensaml/3.2.1/$pkgname-$pkgver.tar.gz"
        "https://shibboleth.net/downloads/c++-opensaml/3.2.1/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('b8ad9adee8d71914e700a06bb2ae1caa5d32806213a2f08490097ae22fbd405b'
            'SKIP')
validpgpkeys=('DCAA15007BED9DE690CD9523378B845402277962')

build() {
  cd "$pkgname-$pkgver"
  export CXXFLAGS+=" -std=gnu++14"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et:
