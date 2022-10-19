# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gmssl
pkgver=3.0.0
pkgrel=1
pkgdesc="Chinese national cryptographic algorithms and protocols"
arch=('i686' 'x86_64')
url="http://gmssl.org/"
license=('apache')
depends=('glibc')
makedepends=('cmake')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/guanzhi/GmSSL/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36cacd171493ee815340877d2f560822166973f8e3132340155ffe84db958470')


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
