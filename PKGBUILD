# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-replay-source
pkgver=1.6.13
pkgrel=1
pkgdesc="Plugin to (slow motion) instant replay sources from memory"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/replay-source.686/"
license=("GPL2")
depends=("obs-studio>=30" "glibc")
makedepends=("cmake" "git")
options=('debug')
source=("$pkgname::git+https://github.com/exeldro/$pkgname#tag=$pkgver")
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
