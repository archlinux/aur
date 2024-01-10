# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dde-shell
pkgver=0.0.4
pkgrel=1
pkgdesc='New DDE shell'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-shell"
license=('LGPL3')
depends=('dtk6declarative' 'qt6-wayland')
makedepends=('git' 'qt6-tools' 'qt5-tools' 'dtk6declarative' 'qt6-wayland' 'cmake' 'ninja')
groups=('deepin')
source=("https://github.com/linuxdeepin/dde-shell/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('07c3ee1d8318ad58a5490785b28cffe05f70f8e4526980a4f59a297cf9ea50e6cca672791d750adc06961e10e1d894b48b2a5d66f25832c13fc05ba3a80d64b4')

build() {
  cd $pkgname-$pkgver
  cmake -GNinja \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build .
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
