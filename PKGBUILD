# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libhtp
pkgver=0.5.29
pkgrel=1
pkgdesc="HTP library - a security-aware parser for the HTTP protocol"
arch=('i686' 'x86_64')
url="https://github.com/OISF/libhtp"
license=('GPL2')
depends=('zlib')
source=($pkgname-$pkgver.tar.gz::https://github.com/ironbee/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('8044d75a2a361ec503773dfa2ba7d6fdc57f0bdaba9972de08e25c63478e9157')

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
