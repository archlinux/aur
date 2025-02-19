pkgname=xml-security-c
pkgver=3.0.0
pkgrel=2
pkgdesc="Shibboleth Project's C++ implementation of W3C security standards for XML"
url="https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2067398783/XML-Security-C"
arch=(x86_64)
license=(Apache)
depends=(
  xerces-c
)
# Git: https://git.shibboleth.net/git/cpp-xml-security.git
source=("https://shibboleth.net/downloads/xml-security-c/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://shibboleth.net/downloads/xml-security-c/$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('5976ba9e72cbb61bd70df3f91d064ffcec8d0b3ba39c5cf4856f96f9efeb9a76'
            'SKIP')
validpgpkeys=('DCAA15007BED9DE690CD9523378B845402277962')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static
  make
}

package(){
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et:
