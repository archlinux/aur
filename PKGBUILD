# Maintainer: Your Name <admin@matsyos.ml>
pkgname=matsya-appmotor
pkgver=1.1
pkgrel=1
pkgdesc="Application Launcher of Matsya Ui"
arch=('x86_64')
url="https://github.com/MatsyaOs/appmotor"
license=('GPL')
groups=('Matsya')
makedepends=('cmake' 'qt6-base' 'qt6-declarative')
depends=('qt6-base' 'qt6-declarative')
source=()
md5sums=('SKIP')

build() {
    cd src
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install src/build
}
