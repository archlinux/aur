# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=kddockwidgets
pkgver=2.2.0
pkgrel=1
pkgdesc="KDAB's Dock Widget Framework for Qt"
url="https://github.com/KDAB/KDDockWidgets"
license=("GPL-2.0-only" "GPL-3.0-only" "custom:KDAB commercial license")
arch=('x86_64')
depends=('qt5-declarative' 'qt5-x11extras' 'qt5-base')
optdepends=('fmt' 'nlohmann-json' 'spdlog')
makedepends=('cmake' 'ninja' 'qt5-tools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('02672f3ae864ed278e47602bebd8e5b1051a8d592678c829c171ce812d8469b2')

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
