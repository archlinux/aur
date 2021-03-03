# Maintainer: yangon99 <yangon99_all@outlook.com>

_gitname=do-it-yourself-bar
pkgname=plasma-applets-doityourselfbar
pkgver=1.2
pkgrel=1
pkgdesc="KDE Plasma panel applet for creating text-based widgets"
arch=("x86_64")
url="https://github.com/wsdfhjxc/${_gitname}"
license=("GPL3")
depends=("plasma-workspace")
makedepends=("extra-cmake-modules")
# install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wsdfhjxc/do-it-yourself-bar/archive/${pkgver}.tar.gz")
sha512sums=('5954c349347c958e5c73f703ff695c4f32b643ac8fb7611059408a27a0999f10142f1b42ae4c9ac170473d5819e454ca7e0df1136a229e93a82c0197a0e22049')

build() {
    mkdir build
    cd build
    cmake ../do-it-yourself-bar-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
