# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-browser-transition
pkgver=0.1.0
pkgrel=1
pkgdesc="Plugin for OBS Studio to show a browser source during scene transition"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/browser-transition.1653/"
license=("GPL2")
depends=("obs-studio>=28" "obs-browser")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=97b9f8aedc349d23d41a2d9e26cf9df1b126bf3d")
sha256sums=("SKIP")

build() {
  cd "$pkgname"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF

  make -C build
}

package() {
  cd "$pkgname"
  make -C build DESTDIR="$pkgdir/" install
}
