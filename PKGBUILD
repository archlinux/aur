# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=kddockwidgets
pkgver=2.2.5
pkgrel=1
pkgdesc="KDAB's Dock Widget Framework for Qt"
url="https://github.com/KDAB/KDDockWidgets"
license=("GPL-2.0-only" "GPL-3.0-only" "custom:KDAB commercial license")
arch=('x86_64')
depends=('qt5-declarative' 'qt5-x11extras' 'qt5-base')
optdepends=('fmt' 'nlohmann-json' 'spdlog')
makedepends=('cmake' 'ninja' 'qt5-tools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c202d03a0c7018aebcb249b09122d846b34298d88d0bc247a601f48c7513c89')

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
