# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libhtp
pkgver=0.5.15
pkgrel=1
pkgdesc="HTP library - a security-aware parser for the HTTP protocol"
arch=('i686' 'x86_64')
url="http://www.openinfosecfoundation.org/index.php/downloads"
license=('GPL2')
source=(https://github.com/ironbee/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('ccd2e18e1efd3c31ae4a8967a630fb2a8339c082f66ecf79f50e44e8f120c64f')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
