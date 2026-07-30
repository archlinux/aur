# Maintainer: Your Name <admin@matsyos.ml>
pkgname=matsya-screenlocker
pkgver=1.1
pkgrel=1
pkgdesc="Screen Locker of Matsya Ui"
arch=('x86_64')
url="https://github.com/MatsyaOs/screenlocker"
license=('GPL')
groups=('Matsya')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-base' 'qt6-declarative' 'qt6-wayland'
             'qt6-tools' 'kwindowsystem' 'kwayland' 'kguiaddons'
             'kconfig' 'kconfigwidgets' 'kcoreaddons' 'polkit' 'polkit-qt6'
             'xorg-server-devel' 'xf86-input-libinput' 'xf86-input-synaptics')
depends=('qt6-base' 'qt6-declarative' 'kwindowsystem' 'kwayland'
         'kguiaddons' 'kcoreaddons' 'polkit-qt6')
source=()
md5sums=('SKIP')

build() {
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
