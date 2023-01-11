pkgname=log4shib
pkgver=2.0.1
pkgrel=1
pkgdesc="Shibboleth Project's fork of log4cpp"
url="https://wiki.shibboleth.net/confluence/display/OpenSAML/log4shib"
license=(LGPL2)
arch=(x86_64)
depends=(gcc-libs)
source=("https://shibboleth.net/downloads/log4shib/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://shibboleth.net/downloads/log4shib/$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('aad37f3929bd3d4c16f09831ff109c20ae8c7cb8b577917e3becb12f873f26df'
            'SKIP')
validpgpkeys=('DCAA15007BED9DE690CD9523378B845402277962')

build() {
  cd "$pkgname-$pkgver"
  export CXXFLAGS+=" -std=gnu++14"
  ./configure \
    --prefix=/usr \
    --disable-static \
    --disable-doxygen \
    ;
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et:
