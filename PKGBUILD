# Maintainer: Adrien Gallouët <adrien@gallouet.fr>
pkgname=glorytun
pkgver=0.3.3
pkgrel=1
pkgdesc="A small, simple and secure VPN"
arch=('x86_64')
url="https://github.com/angt/glorytun"
license=('BSD')
depends=('libsodium' 'iproute2')
makedepends=('libsodium' 'pkg-config')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('6c4a6bb5adde863b100f7bcf2a72b783')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install-strip
}
