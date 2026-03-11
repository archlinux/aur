# Maintainer: banaxi <banaxitech@gmail.com>
pkgname=bterminal
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK4/VTE terminal emulator"
arch=('x86_64')
url="https://github.com/Banaxi-Tech/BTerminal"
license=('GPL3')
depends=('gtk4' 'vte4' 'zsh')
makedepends=('cmake' 'pkg-config')
# This line tells the AUR to download your code FROM GitHub
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

build() {
  # This folder name MUST match the pkgname above
  cmake -B build -S "$pkgname" -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
