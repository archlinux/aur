# Maintainer: cupnoodles <cupn8dles@gmail.com>

pkgname=plasma5-applets-virtual-desktop-bar-git
pkgver=r422.25ec1c0
pkgrel=1
pkgdesc='KDE Plasma panel applet for managing virtual desktops'
arch=(i686 x86_64)
url='https://github.com/wsdfhjxc/virtual-desktop-bar'
license=(GPL3)
depends=(kglobalaccel qt5-base qt5-declarative qt5-x11extras kxmlgui plasma-framework)
makedepends=(cmake extra-cmake-modules gcc)
source=('git://github.com/wsdfhjxc/virtual-desktop-bar.git')
md5sums=('SKIP')

pkgver() {
    cd virtual-desktop-bar
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../virtual-desktop-bar
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
