# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-replay-source
pkgver=1.7.0
pkgrel=1
pkgdesc="Plugin to (slow motion) instant replay sources from memory"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/replay-source.686/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=30" "glibc")
makedepends=("cmake" "git")
options=('debug')
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=6590fde1c8e4f8c733016646a8165d52e28d094b")
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
