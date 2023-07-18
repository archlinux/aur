# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-browser-transition
pkgver=0.1.1
pkgrel=1
pkgdesc="Plugin for OBS Studio to show a browser source during scene transition"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/browser-transition.1653/"
license=("GPL2")
depends=("obs-studio>=28" "obs-browser")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=130668d6561a4297632ff974006143e643a69c87")
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
