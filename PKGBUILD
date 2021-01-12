# Maintainer: Omar Alkersh <oalkersh at protonmail dot com>
pkgname=shortcut-mapper-git
pkgver=v0.1.2.r0.g7da8094
pkgrel=1
epoch=
pkgdesc=""
arch=(x86_64)
url="https://github.com/OZoneGuy/shortcut-mapper.git"
license=('GPL')
groups=()
depends=(xorg-server)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "shortcut-mapper"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "shortcut-mapper"
  cmake . -B build
  cmake --build build
}

package() {
  cd "shortcut-mapper"
  sudo cmake --install build
}
