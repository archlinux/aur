# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gmssl
pkgver=3.1.0
pkgrel=1
pkgdesc="Chinese national cryptographic algorithms and protocols"
arch=('i686' 'x86_64')
url="http://gmssl.org/"
license=('Apache')
depends=('glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/guanzhi/GmSSL/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a3cdf5df87b07df33cb9e30c35de658fd0c06d5909d4428f4abd181d02567cde')


build() {
  cd "GmSSL-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ./
  make -C "_build"
}

check() {
  cd "GmSSL-$pkgver"

  #make -C "_build" test
}

package() {
  cd "GmSSL-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
}
