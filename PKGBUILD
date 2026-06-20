# Maintainer: RyuZinOh <https://github.com/RyuZinOh>
pkgname=connecttebayo
pkgver=0.1.0
pkgrel=1
pkgdesc="Qt6 QML plugin for IWD-based WiFi management via DBus"
arch=('x86_64')
url="https://github.com/RyuZinOh/connecttebayo"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'iwd')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RyuZinOh/connecttebayo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('44e86f5876270ad5207cd694ff64b0e83ad13a5f390e3874c542d0ea3665720e')

build() {
  cmake -B build -S "connecttebayo-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
