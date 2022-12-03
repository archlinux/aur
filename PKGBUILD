# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-freeze-filter
pkgver=0.3.3
pkgrel=1
pkgdesc="Filter to freeze a frame of a source"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/freeze-filter.950/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#tag=$pkgver")
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
