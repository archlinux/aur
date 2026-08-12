# Maintainer: Happilli <https://github.com/Happilli>
pkgname=drawness
pkgver=1.0.0
pkgrel=1
pkgdesc="A freehand drawing QML plugin.."
arch=('x86_64')
url="https://github.com/Happilli/drawness"
license=('MIT')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake' 'ninja' 'qt6-tools' 'qt6-shadertools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Happilli/drawness/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('85282bc607016b6a0ded62667fcc82203ad9453fec35da80ba3ba5008bd2652a')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
