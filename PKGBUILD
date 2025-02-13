# Maintainer: CToID <funk443@yahoo.com.tw>

pkgname=fcitx5-array
pkgver=0.9.4
pkgrel=1
pkgdesc="Array 30 input method engine for Fcitx 5 project."
arch=("any")
url="https://github.com/ray2501/fcitx5-array"
license=("GPL-2.0-or-later")

depends=("fcitx5")
makedepends=(
  "cmake"
  "extra-cmake-modules"
  "sqlite"
  "gettext"
  "fmt"
)

source=("https://github.com/ray2501/fcitx5-array/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("98a2279ea04f738fe88a65039cd989774c5be5e9a383b437590b372c344e35d4")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
  make DESTDIR=$pkgdir install
}
