# Maintainer: William Gathoye <william + aur at gathoye dot be>

pkgname=plasma5-applets-netspeed
pkgver=1.7
pkgrel=1
pkgdesc='Plasma 5 widget that displays the currently used network bandwidth'
arch=('i686' 'x86_64')

url='https://github.com/dfaust/plasma-applet-netspeed-widget'
license=('GPL2')

makedepends=('git' 'cmake' 'extra-cmake-modules' 'plasma-framework')

source=(
    "https://github.com/dfaust/plasma-applet-netspeed-widget/archive/v${pkgver}.tar.gz"
)
sha512sums=(
    '6e0ca9d450dc477b64af8da9df69c052bea9796fcad6ec5cea3bf0ab404bcfd0f513f4f5a4706d45934021ae7d364f506690d79ac2b0b4d616b48addc261e4b4'
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

