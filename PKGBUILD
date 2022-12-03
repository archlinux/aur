# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-recursion-effect
pkgver=0.0.5
pkgrel=1
pkgdesc="Plugin for add recursion effect to a source using a filter"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/recursion-effect.1008/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=c201ab49997ab96288e5a40fd9239de5066441a0")
sha256sums=("SKIP")

build() {
  cd "$pkgname"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6

  make -C build
}

package() {
  cd "$pkgname"
  make -C build DESTDIR="$pkgdir/" install
}
