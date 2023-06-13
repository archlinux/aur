pkgname=xmltooling
pkgver=3.2.4
pkgrel=1
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
sha256sums=('7e8e3437b86be84207498665ff4dd491a51a647faca5ae7c03854558c6324795'
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
