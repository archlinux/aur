# Maintainer: Adrien Gallouët <adrien@gallouet.fr>
pkgname=glorytun
pkgver=0.1.3
pkgrel=1
pkgdesc="A small, simple and secure VPN"
arch=('x86_64')
url="https://github.com/angt/glorytun"
license=('BSD')
depends=('libsodium' 'iproute2')
makedepends=('libsodium' 'pkg-config')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('85159d09123fcde49dfccf98e12a7093')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install-strip
}
