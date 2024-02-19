# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-move-transition
pkgver=2.10.0
pkgrel=1
pkgdesc="Plugin for OBS Studio to move sources to a new position during scene transition"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/move-transition.913/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc")
makedepends=("cmake" "git")
options=('debug')
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=4097f7bbd892e2671640a409304bf4f4bcc318ec")
sha256sums=("SKIP")

build() {
  cmake -B build -S $pkgname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
