# Maintainer: rootjdev <rootjdev@gmail.com>
pkgname=assemblyline-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="An in-memory assembler for x86. (latest stable release)"
arch=(x86_64)
url="https://github.com/0xAde1a1de/assemblyline.git"
license=('Apache')
makedepends=(tar make libtool)
provides=(libassemblyline asmline)
source=("https://github.com/0xADE1A1DE/AssemblyLine/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.tar.gz")
sha256sums=(f794631925d587b490cfb2e95b780b99c01577267e88a706374c67d127dc4c79)
md5sums=(1ca7f36dedd28f05c2a245dd3342316c)
sha1sums=(60f320ab13f93cb4734efcdc746c12e75d862607)

build() {
  cd "${pkgname%-bin}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-bin}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}
