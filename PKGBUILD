# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=libplctag
pkgver=2.0.17
pkgrel=1
pkgdesc="This library provides a portable and simple API for accessing Allen-Bradley PLC data over Ethernet"
arch=('x86_64')
url="https://github.com/kyle-github/$pkgname"
license=('GPL')
makedepends=('cmake')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('c17616713884aa00333af0750799371481cd06cb30e5915d367b25ea3770a678cabf15c1d500c8a601e73b8fd218005e39ba131aed100539e3066e4ccda81bfc')

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
