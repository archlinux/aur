# Maintainer: Adrien Gallouët <adrien@gallouet.fr>
pkgname=glorytun
pkgver=0.2.0
pkgrel=1
pkgdesc="A small, simple and secure VPN"
arch=('x86_64')
url="https://github.com/angt/glorytun"
license=('BSD')
depends=('libsodium' 'iproute2')
makedepends=('libsodium' 'pkg-config')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('0704fe7eb77fc9cb82fdbe060e0fb9e0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install-strip
}
