# Maintainer: MatsyaOS <admin@matsyaos.ml>
pkgname=matsya-kwin-plugins
pkgver=1.1
pkgrel=1
pkgdesc="MatsyaOS KWin plugins"
arch=('x86_64')
url="https://github.com/MatsyaOs/kwin-plugins"
license=('GPL')
groups=('Matsya')
makedepends=('cmake' 'extra-cmake-modules' 'ninja' 'qt6-base' 'qt6-declarative' 'qt6-tools')
depends=('qt6-base' 'qt6-declarative')
source=()
md5sums=('SKIP')

build() {
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
