# Maintainer: Kamil Śliwak <cameel2@gmail.com>

pkgname=plasma5-applets-audio-device-switcher
pkgver=0.1.1
pkgrel=1
pkgdesc="KDE Plasma 5 widget to change the default audio output device/sink"
arch=('any')
url="https://github.com/akrutzler/plasma-audio-device-switcher"
license=('GPL2')
depends=("plasma-workspace")
makedepends=("cmake")
source=(https://github.com/akrutzler/plasma-audio-device-switcher/archive/$pkgver.tar.gz)
sha256sums=('f42a04afbea630c712a95fd47065ce39ca535ddd0a63d5e92df4dc2e96b0cbb7')

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
