# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-recursion-effect
pkgver=0.0.6
pkgrel=1
pkgdesc="Plugin for add recursion effect to a source using a filter"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/recursion-effect.1008/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
options=('debug')
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=bf726d0a3e9429c8c447fc1d87b3a932b2a6ad90")
sha256sums=("SKIP")

build() {
  cd "$pkgname"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=None \
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
