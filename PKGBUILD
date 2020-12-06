# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libhtp
pkgver=0.5.36
pkgrel=1
pkgdesc="HTP library - a security-aware parser for the HTTP protocol"
arch=('i686' 'x86_64')
url="https://github.com/OISF/libhtp"
license=('GPL2')
depends=('zlib')
source=($pkgname-$pkgver.tar.gz::https://github.com/ironbee/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('ab1dd6cfd4ab4c36624a5c74793d80d1b7f50f5791620f47bfd831a79e32bc4b')

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
