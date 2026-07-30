# Maintainer: Your Name <admin@matsyos.ml>
pkgname=matsya-terminal
pkgver=1.1
pkgrel=1
pkgdesc="Terminal of Matsya Ui"
arch=('x86_64')
url="https://github.com/MatsyaOs/terminal"
license=('GPL')
groups=('Matsya')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-base' 'qt6-declarative' 'qt6-tools')
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
