# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=kddockwidgets
pkgver=2.1.0
pkgrel=1
pkgdesc="KDAB's Dock Widget Framework for Qt"
url="https://github.com/KDAB/KDDockWidgets"
license=("GPL-2.0-only" "GPL-3.0-only" "custom:KDAB commercial license")
arch=('x86_64')
depends=('qt5-declarative' 'qt5-x11extras' 'qt5-base')
optdepends=('fmt' 'nlohmann-json' 'spdlog')
makedepends=('cmake' 'ninja' 'qt5-tools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('360e33b5ee1446c64b20449e03b065d4e2df137f534177a1e63440532ae50695')

build() {
  cmake -S KDDockWidgets-$pkgver -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
