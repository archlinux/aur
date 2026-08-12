pkgname=unikey-wayland
pkgver=2.0.10
pkgrel=1
pkgdesc="Unikey Wayland Input Method for Vietnamese"
arch=('x86_64' 'aarch64')
url="https://github.com/ubuntu2310fake/Unikey-Wayland"
license=('GPL3')
depends=('qt6-base' 'wayland' 'ibus' 'libxkbcommon' 'libx11' 'libxtst')
makedepends=('cmake' 'wayland-protocols' 'git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ubuntu2310fake/Unikey-Wayland/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "Unikey-Wayland-${pkgver}"
  mkdir -p wayland-client/build
  cd wayland-client/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib ..
  make
}

package() {
  cd "Unikey-Wayland-${pkgver}/wayland-client/build"
  make DESTDIR="$pkgdir" install
}
