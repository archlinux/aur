# Maintainer: lonaowna
# Contributor: Xandaros
pkgname=libcoap
pkgver=4.3.4
pkgrel=1
pkgdesc="C-Implementation of CoAP"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://libcoap.net/"
license=('BSD2' 'GPL2')
makedepends=('git' 'doxygen' 'asciidoc')
provides=('coap-client' 'coap-rd' 'coap-server')
source=("https://github.com/obgm/libcoap/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('482408115b1ee2c506e4e5758c8cc4fa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
