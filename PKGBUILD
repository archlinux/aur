# Maintainer: Your Name <admin@matsyos.ml>
pkgname=matsya-filemanager
pkgver=1.1
pkgrel=1
pkgdesc="File Manager of Matsya Ui"
arch=('x86_64')
url="https://github.com/MatsyaOs/filemanager"
license=('GPL')
groups=('Matsya')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-base' 'qt6-declarative' 'qt6-tools'
             'kio' 'kfilemetadata' 'kiconthemes' 'kcoreaddons' 'kconfig'
             'kbookmarks' 'kwindowsystem' 'kdeclarative')
depends=('qt6-base' 'qt6-declarative' 'kio' 'kwindowsystem'
         'kfilemetadata' 'kiconthemes' 'kcoreaddons')
source=()
md5sums=('SKIP')

build() {
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
