# Maintainer: MISTER NEGATIVE <misternegative21@gmail.com>

pkgname=matsya-sddm-theme
pkgver=1.1
pkgrel=1
pkgdesc="Matsya SDDM Theme"
arch=('x86_64')
url="https://github.com/MatsyaOs/sddm-theme"
license=('GPL-3.0-only')
makedepends=('extra-cmake-modules' 'ninja' 'qt6-tools' 'cmake')
depends=('qt6-declarative' 'sddm')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  cmake --build build -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
