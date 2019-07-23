# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=libplctag
pkgver=2.0.20
pkgrel=1
pkgdesc="This library provides a portable and simple API for accessing Allen-Bradley PLC data over Ethernet"
arch=('x86_64')
url="https://github.com/kyle-github/$pkgname"
license=('GPL')
makedepends=('cmake')
source=("$url/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
  mkdir build && cd build

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr ".."
  make
}

package() {
	cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
sha512sums=('ce7769512e28cbe647bcfedb7f80f642c42a774db7465c8a24c4263fa4190d4eee18dfa63edd446890e4294ffae4785a4eff2182cd90726dcf9ed234543c87f0')
