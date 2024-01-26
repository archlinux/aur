# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-browser-transition
pkgver=0.1.3
pkgrel=1
pkgdesc="Plugin for OBS Studio to show a browser source during scene transition"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/browser-transition.1653/"
license=("GPL-2.0-or-later")
depends=("obs-studio>=28" "obs-browser" "glibc")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=42bec5f094c8361c44a8ce53386abbf3647ceb2d")
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
