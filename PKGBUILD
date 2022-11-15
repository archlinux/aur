# Maintainer: rootjdev <rootjdev@gmail.com>
pkgname=assemblyline-bin
pkgver=1.3.2
pkgrel=0
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
  make clean all
}

package() {
  cd "${pkgname%-bin}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
sha256sums=('411f181d07ecc112c9dae31b167d98880705485f3ac9e8c70c4f4e84a67a70cd')
