# Maintainer: thynkon <thynkon at protonmail dot com>
pkgname=mitama-cpp-result
pkgver=11.0.0
pkgrel=1
pkgdesc="A Library that provides 'result<T, E>' and 'maybe<T>' and monadic functions for them. "
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://loligothick.github.io/mitama-cpp-result/"
license=('MIT')
depends=('fmt')
makedepends=('git' 'make' 'cmake' 'pkg-config')
source=("$pkgname"-"$pkgver".tar.gz::https://github.com/loliGothicK/${pkgname}/archive/v"$pkgver".tar.gz)
sha256sums=('fdfe81098660e7365e79760616231eefdd42dd7760970c0e7ea4c6bacce46440')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -S . -B build
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
