# Maintainer: Sanchit Samuel <your-email@example.com>
pkgname=mount-manager
pkgver=0.3
pkgrel=1
pkgdesc="Manage disk partitions and automount configurations via /etc/fstab"
arch=('x86_64')
url="https://gitlab.com/sanchitsamuel/mount-manager"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'polkit' 'util-linux')
makedepends=('cmake' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/sanchitsamuel/mount-manager/-/archive/v$pkgver/mount-manager-v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cmake -B build -S "$pkgname-v$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
