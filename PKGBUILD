# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-scene-as-transition
pkgver=1.1.0
pkgrel=1
pkgdesc="A plugin for OBS Studio that will allow you to use a Scene as a Transition"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/scene-as-transition.1704/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/andilippi/$pkgname#tag=v$pkgver")
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
