# Maintainer: zccrs <zhangjide@deepin.org>
pkgname=treeland
pkgver=0.1.1
pkgrel=1
pkgdesc='a new wayland compositer for DDE'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/treeland"
license=('LGPL3')
depends=('qt6-declarative')
makedepends=('git' 'qt6-tools' 'waylib' 'cmake'  'ninja')
groups=('deepin')
source=("https://github.com/linuxdeepin/treeland/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  cmake -GNinja \
      -DCMAKE_INSTALL_LIBEXECDIR=libexec \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release

  cmake --build .
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
