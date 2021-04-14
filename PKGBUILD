# Maintainer: lonaowna
# Contributor: Xandaros
pkgname=libcoap
pkgver=4.3.0_rc1
pkgrel=1
pkgdesc="C-Implementation of CoAP"
arch=('x86_64')
url="https://libcoap.net/"
license=('BSD2' 'GPL2')
makedepends=('git' 'doxygen' 'asciidoc')
source=("https://github.com/obgm/libcoap/archive/refs/tags/v${pkgver//_/-}.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
