# Maintainer: Minnow Contributors <noreply@example.com>
pkgname=minnow
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple, lightweight file manager for KDE"
arch=('x86_64')
url="https://github.com/minnowfm/minnow"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'kcoreaddons' 'kconfigwidgets' 'kwidgetsaddons' 'kio' 'kfilemetadata' 'karchive' 'knotifications')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/minnowfm/minnow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('600c8eb08ee8a49c9197c39586b8f13a574a55f03579cf5ab193106d31e97ea4')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
