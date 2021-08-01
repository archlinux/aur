# Maintainer: Kamil Śliwak <cameel2@gmail.com>

pkgname=plasma5-applets-audio-device-switcher
pkgver=0.3.0
pkgrel=1
pkgdesc="KDE Plasma 5 widget to change the default audio output device/sink"
arch=('any')
url="https://github.com/akrutzler/plasma-audio-device-switcher"
license=('GPL2')
depends=("plasma-workspace")
makedepends=("cmake" "extra-cmake-modules")
source=(https://github.com/akrutzler/plasma-audio-device-switcher/archive/$pkgver.tar.gz)
sha256sums=('7d3da6ebd6a1457c81eea4cf602ba8c3964535162ae27a52d26d6b70f0438163')

prepare() {
    mkdir --parents build/
}

build() {
    cd build/

    export QT_SELECT=5
    cmake "../plasma-audio-device-switcher-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd build/

    make install DESTDIR="$pkgdir/"
}
