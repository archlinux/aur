# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=kddockwidgets
pkgver=2.0.0
pkgrel=1
arch=('x86_64')
pkgdesc="KDAB's Dock Widget Framework for Qt"
license=("GPL2" "custom:KDAB commercial license")
depends=('qt5-base' 'qt5-x11extras')
makedepends=('cmake' 'git' 'ninja' 'qt5-tools')
url="https://github.com/KDAB/KDDockWidgets"
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cmake -S $pkgname -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
