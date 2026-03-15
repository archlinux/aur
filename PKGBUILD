# Maintainer: Andrew Shark <ashark linuxcomp ru>

pkgname=plasma6-runners-translator
_name=krunner-translator
pkgver=2.0
pkgrel=1
pkgdesc="Translates words and sentences into any language"
arch=("x86_64")
url="https://github.com/naraesk/krunner-translator"
license=("GPL3")
depends=("krunner" "translate-shell")
makedepends=("cmake" "extra-cmake-modules")

source=("$_name-$pkgver.tar.gz::https://github.com/naraesk/krunner-translator/archive/refs/tags/v2.0.tar.gz")
sha256sums=("88bb19d37e4419d867832b7bf5a5435ceac14577a7eabb93d95dba07cc491712")

build() {
  cmake -B build -S "$_name-$pkgver"
  cmake --build build --parallel --config Release
}

package() {
  DESTDIR="$pkgdir" cmake --install build --config Release
}
