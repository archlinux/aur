# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libhtp
pkgver=0.5.32
pkgrel=1
pkgdesc="HTP library - a security-aware parser for the HTTP protocol"
arch=('i686' 'x86_64')
url="https://github.com/OISF/libhtp"
license=('GPL2')
depends=('zlib')
source=($pkgname-$pkgver.tar.gz::https://github.com/ironbee/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('a6a6f3b3f1fb6e8b8a1dae02db8a0090c438f0d057102dd8e52208224868c4e4')

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
