pkgname=log4shib2
_pkgname=log4shib
pkgver=2.0.0
pkgrel=0
pkgdesc="Shibboleth Project fork of log4cpp -- temporarily packaged under a different pkgname"
url="https://wiki.shibboleth.net/confluence/display/OpenSAML/log4shib"
license=(LGPL2)
arch=(x86_64)
depends=(gcc-libs)
conflicts=($_pkgname)
provides=("$_pkgname=$pkgver")
source=("https://shibboleth.net/downloads/log4shib/$pkgver/$_pkgname-$pkgver.tar.gz"
        "https://shibboleth.net/downloads/log4shib/$pkgver/$_pkgname-$pkgver.tar.gz.asc")
sha256sums=('d066e2f208bdf3ce28e279307ce7e23ed9c5226f6afde288cd429a0a46792222'
            'SKIP')
validpgpkeys=('DCAA15007BED9DE690CD9523378B845402277962')

build() {
  cd "$pkgname-$pkgver"
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
