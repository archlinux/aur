# Maintainer: jerry73204 <jerry73204@gmail.com>

pkgname=elfio
pkgver=3.2
pkgrel=2
pkgdesc="ELFIO is a small, header-only C++ library that provides a simple interface for reading and generating files in ELF binary format"
arch=('i686' 'x86_64')
url="http://elfio.sourceforge.net/"
license=('MIT License')
depends=('gcc-libs')
makedepends=()
options=('strip')
source=("http://sourceforge.net/projects/elfio/files/ELFIO-sources/ELFIO-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8aba1fb7fe292581747e8a5f70aaea1ba591e9c14b664f8c7c69c7534a5c1022')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
