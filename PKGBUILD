# Maintainer: Lucas Moidel <lucas122133@gmail.com>

pkgname=fjord-engine-git
pkgver=r172.f6af25a
pkgrel=1
pkgdesc="A simple 2d game engine based off of SDL2"
arch=(x86_64)
url="https://github.com/Lucasmoidel/Fjord.git"
license=(GPL-3.0-only)
makedepends=(git make sdl2 sdl2_ttf nlohmann-json yaml-cpp box2d cmake)
provides=(fjord-engine)
conflicts=(fjord-engine)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd Fjord
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd Fjord
  make DESTDIR="${pkgdir}" install
}