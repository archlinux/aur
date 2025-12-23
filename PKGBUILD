# Maintainer: Piratheon <chafiq.dev@gmail.com>
pkgname=ori
pkgver=1.0.0
pkgrel=1
pkgdesc="OpenRouter Interactive Terminal AI Assistant"
arch=(x86_64)
url="https://gitlab.archlinux.org/piratheon/ori"
license=(GPL-3.0-only)
depends=(curl jsoncpp bash gcc-libs glibc)
makedepends=(cmake gcc make pkg-config)
#source=("ori-v${pkgver}.tar.gz::https://gitlab.archlinux.org/piratheon/ORI/-/archive/v-${pkgver}/ori-v${pkgver}.tar.gz")
source=("ori-v${pkgver}.tar.gz::https://github.com/piratheon/ori/archive/refs/tags/v${pkgver}.tar.gz")
build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}
sha256sums=('ea85f2903780aa9f199c1fc8ea83d098feb6ccc76ee60b123eb2a6236123c877')
package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
