# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-browser-transition
pkgver=0.1.2
pkgrel=1
pkgdesc="Plugin for OBS Studio to show a browser source during scene transition"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/browser-transition.1653/"
license=("GPL2")
depends=("obs-studio>=28" "obs-browser")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=2d708bd8f09e3faed562bf2164c863af32aa7259")
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
