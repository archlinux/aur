# Maintainer: jerry73204 <jerry73204@gmail.com>

pkgname=elfio
pkgver=3.4
pkgrel=1
pkgdesc="ELFIO is a small, header-only C++ library that provides a simple interface for reading and generating files in ELF binary format"
arch=('i686' 'x86_64')
url="http://elfio.sourceforge.net/"
license=('MIT')
depends=('gcc-libs')
makedepends=()
options=('strip')
source=("${pkgname%-git}"::'git+https://github.com/serge1/ELFIO.git#tag=Release_3.4')
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}"
  make -k check
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
