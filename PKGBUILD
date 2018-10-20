# Maintainer: William Gathoye <william + aur at gathoye dot be>

pkgname=plasma5-applets-netspeed
pkgver=1.5
pkgrel=1
pkgdesc='Plasma 5 widget that displays the currently used network bandwidth'
arch=('i686' 'x86_64')

url='https://github.com/dfaust/plasma-applet-netspeed-widget'
license=('GPL2')

makedepends=('git' 'cmake' 'extra-cmake-modules')

source=(
    "https://github.com/dfaust/plasma-applet-netspeed-widget/archive/v${pkgver}.tar.gz"
)
sha512sums=(
    '36e149cbf40bdec63ba6179c58ebe3ce7293ba4105df7c9512d63feba5487091add23589fbcd2a3abcda24dd39f9985036d58b3f5255f0cf4dac6077d2f641fd'
)

build() {
    cd "plasma-applet-netspeed-widget-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr 
    make
}

package() {
    cd "plasma-applet-netspeed-widget-${pkgver}"
    make DESTDIR="$pkgdir/" install
}

