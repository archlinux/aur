# Maintainer: Arnaud Berthomier <oz-cypr-dot-io>

_pkgname=telegram-tdlib
pkgname=${_pkgname}
pkgver=1.3.0
pkgrel=1
pkgdesc='Cross-platform library for building Telegram clients'
arch=('i686' 'x86_64')
url='https://core.telegram.org/tdlib'
license=('Boost')
depends=('openssl' 'zlib')
makedepends=('make' 'gcc' 'cmake' 'gperf')
provides=('telegram-tdlib')
conflicts=('telegram-tdlib')
source=("https://github.com/tdlib/td/archive/v$pkgver.tar.gz")
md5sums=('0f9ba83b29686ae7d40a0f227ff3cc6f')

build() {
  cd "${srcdir}/td-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

package() {
  cd "${srcdir}/td-$pkgver/build"
  mkdir -p ${pkgdir}/usr
  cmake --build . --target install
}

