# Maintainer: Your Name <admin@matsyos.ml>
pkgname=matsya-statusbar
pkgver=1.1
pkgrel=1
pkgdesc="Status Bar of Matsya Ui"
arch=('x86_64')
url="https://github.com/MatsyaOs/statusbar"
license=('GPL')
groups=('Matsya')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-base' 'qt6-declarative' 'qt6-wayland'
             'qt6-tools' 'kwindowsystem' 'kconfig' 'kcoreaddons'
             'kirigami' 'networkmanager-qt' 'modemmanager-qt'
             'xorg-server-devel' 'pkgconf')
depends=('qt6-base' 'qt6-declarative' 'kwindowsystem' 'kconfig'
         'kcoreaddons' 'networkmanager-qt' 'modemmanager-qt')
source=()
md5sums=('SKIP')

build() {
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
