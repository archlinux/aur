# Maintainer: Adrien Gallouët <adrien@gallouet.fr>
pkgname=glorytun
pkgver=0.3.4
pkgrel=2
pkgdesc="A small, simple and secure VPN"
arch=('x86_64')
url="https://github.com/angt/glorytun"
license=('BSD')
depends=('libsodium' 'iproute2')
makedepends=('git' 'libsodium' 'pkg-config')
source=("git+$url#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install-strip
}
