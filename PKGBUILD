# Maintainer: Curve <curve.platin at gmail.com>
pkgname=aawmtt
pkgver=2.1
pkgrel=1
pkgdesc="Another AwesomeWM Testing Tool, with Live Reload and 'proper' display detection"
arch=('any')
url="https://github.com/Curve/aawmtt"
license=('MIT')
depends=('xorg-server-xephyr')
makedepends=('git' 'cmake' 'ninja')
conflicts=('aawmtt')
provides=('aawmtt')
source=("https://github.com/Curve/aawmtt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
  ninja
}

package() {
  # install binary
  install -Dm 755 "${srcdir}/$pkgname-$pkgver/build/$pkgname" "${pkgdir}/usr/bin/$pkgname"
}
