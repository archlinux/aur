# Maintainer: Adrien Gallouët <adrien@gallouet.fr>
pkgname=glorytun
pkgver=0.1.1
pkgrel=1
pkgdesc="A small, simple and secure VPN"
arch=(x86_64)
url="https://github.com/angt/glorytun"
license=('BSD')
depends=('libsodium' 'iproute2')
makedepends=('meson' 'libsodium' 'pkgconfig')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('e9394da94e1e69e5b40d346e8595c389')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build install
}
