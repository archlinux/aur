# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libhtp
pkgver=0.5.31
pkgrel=1
pkgdesc="HTP library - a security-aware parser for the HTTP protocol"
arch=('i686' 'x86_64')
url="https://github.com/OISF/libhtp"
license=('GPL2')
depends=('zlib')
source=($pkgname-$pkgver.tar.gz::https://github.com/ironbee/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('ce16a3e57c7d1f1e8255a4f698e22ddd33c15fb4e737ab90b04c9a1f07e48780')

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
