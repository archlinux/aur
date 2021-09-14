# Maintainer: rootjdev <rootjdev@gmail.com>
pkgname=assemblyline-bin
pkgver=1.0.2
pkgrel=2
pkgdesc="An in-memory assembler for x86. (latest stable release)"
arch=(x86_64)
url="https://github.com/0xAde1a1de/assemblyline.git"
license=('Apache')
makedepends=(tar make libtool)
provides=(libassemblyline asmline)
source=("https://github.com/0xADE1A1DE/AssemblyLine/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.tar.gz")
build() {
  cd "${pkgname%-bin}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-bin}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
md5sums=('e83b3b2bc0600e9774037d8e4ea300cc')
