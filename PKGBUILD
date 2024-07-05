# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-scene-as-transition
pkgver=1.1.1
pkgrel=1
pkgdesc="A plugin for OBS Studio that will allow you to use a Scene as a Transition"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/scene-as-transition.1704/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/andilippi/$pkgname#tag=v$pkgver")
sha256sums=("SKIP")

build() {
  cmake -B build -S $pkgname\
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
