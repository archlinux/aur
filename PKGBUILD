# Maintainer: jerry73204 <jerry73204@gmail.com>

pkgname=elfio
pkgver=3.5
pkgrel=1
pkgdesc="ELFIO is a small, header-only C++ library that provides a simple interface for reading and generating files in ELF binary format"
arch=('i686' 'x86_64')
url="https://github.com/serge1/ELFIO"
license=('MIT')
depends=('gcc-libs')
makedepends=()
options=('strip')
source=("$url/releases/download/Release_$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('38215f17bb1b140c8afbf4c116d5303047619e70446dc393ef041f3c639a01cd')

build() {
  cd "$pkgname-$pkgver"

  autoreconf --install
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
