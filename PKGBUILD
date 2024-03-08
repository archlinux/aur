# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=hardinfo2
pkgver=2.0.12
pkgrel=1
pkgdesc="System Information and Benchmark for Linux Systems."
arch=('x86_64')
url="https://github.com/hardinfo2/hardinfo2"
license=('GPL-2.0-or-later')
depends=('gtk3' 'libsoup3')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('b7ba812b2e43f2873826f7dc5363fc24baf3a7e51da22a7b160b5fe4c5dd23ab')

build() {
  cmake -B build -S "$pkgname-release-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -DHARDINFO2_LIBSOUP3='ON' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
