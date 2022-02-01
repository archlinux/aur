# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libhtp
pkgver=0.5.39
pkgrel=1
pkgdesc="HTP library - a security-aware parser for the HTTP protocol"
arch=('i686' 'x86_64')
url="https://github.com/OISF/libhtp"
license=('GPL2')
depends=('zlib')
source=($pkgname-$pkgver.tar.gz::https://github.com/ironbee/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('d5956b49314fc6a058864130fbcf040a12584ee1e38f3b6ea52aedfa99d4c14a')

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
