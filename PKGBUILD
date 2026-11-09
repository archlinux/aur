# Maintainer: Happilli <https://github.com/happilli>
pkgname=ryu
pkgver=0.0.44
pkgrel=1
pkgdesc="Collection of Qt6 QML plugins for ryu.."
arch=('x86_64')
license=('BSD-2-Clause')
depends=('qt6-base' 'qt6-declarative' 'cliphist' 'wl-clipboard' 'pipewire')
makedepends=('cmake' 'ninja' 'qt6-tools' 'qt6-shadertools')
url="https://github.com/Happilli/ryu"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Happilli/ryu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96989871854268d27a13abea9d26a73ed7fbd19157cb3ec15d0268b4276d5ee1')

build() {
  cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G Ninja && ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

