# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gmssl
pkgver=3.1.1
pkgrel=3
pkgdesc="Chinese national cryptographic algorithms and protocols"
arch=('i686' 'x86_64')
url="http://gmssl.org/"
license=('Apache-2.0')
depends=('glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/guanzhi/GmSSL/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23ed2ce74e408fc4c80289d2b499c7c5eec8373fefaf3827a53cb4c134dd5263')


build() {
  cd "GmSSL-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ./
  cmake --build "_build"
}

check() {
  cd "GmSSL-$pkgver"

  #cmake --build "_build" --target test
}

package() {
  cd "GmSSL-$pkgver"

  DESTDIR="$pkgdir" cmake --install "_build"
}
