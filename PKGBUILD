# Maintainer: Your Name <admin@matsyos.ml>
pkgname=matsya-core
pkgver=1.1
pkgrel=1
pkgdesc="Core System Components of Matsya Ui"
arch=('x86_64')
url="https://github.com/MatsyaOs/core"
license=('GPL')
groups=('Matsya')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-base' 'qt6-declarative' 'qt6-tools'
             'kwindowsystem' 'kconfig' 'kcoreaddons' 'kstatusnotifieritem'
             'sonnet' 'kdoctools' 'polkit-qt6' 'libxcb' 'xcb-util' 'xcb-util-wm'
             'xcb-util-keysyms' 'xcb-util-image' 'xorg-server-devel')
depends=('qt6-base' 'qt6-declarative' 'kwindowsystem' 'kconfig'
         'kcoreaddons' 'polkit-qt6' 'libxcb' 'xcb-util')
source=()
md5sums=('SKIP')

build() {
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
