# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gmssl
pkgver=3.2.0
pkgrel=1
pkgdesc="Chinese national cryptographic algorithms and protocols"
arch=('i686' 'x86_64')
url="http://gmssl.org/"
license=('Apache-2.0')
depends=('glibc')
makedepends=('cmake')
provides=('libgmssl.so')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/guanzhi/GmSSL/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b0bb50f935c1b35c614ff0a7f235b00520b86a3e9a659a681d77be6dadcb5d6b')


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
