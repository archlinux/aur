# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-3d-effect
pkgver=0.1.0
pkgrel=1
pkgdesc="Plugin for OBS Studio adding 3D effect filter"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/3d-effect.1692/"
license=("GPL2")
depends=("obs-studio>=28" "gcc-libs" "glibc")
makedepends=("cmake" "git")
options=('debug')
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=063da575a5a0fb9bc0d5ef3bcfb41c3bf9f43075")
sha256sums=("SKIP")

build() {
  cmake -B build -S $pkgname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
