# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-dir-watch-media
pkgver=0.6.2
pkgrel=1
pkgdesc="Adds a filter you can add to media source to load the oldest or newest file in a directory"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/directory-watch-media.801/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=be0c880d3fcd30a651b82eec4fbe74c096642ae6")
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
