# Maintainer: William Gathoye <william + aur at gathoye dot be>

pkgname=plasma5-applets-netspeed
pkgver=1.4
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
    '09d1ef424aa2a6675d56b7e92658546abab9cfcf24d48977efab681e2caa8ce840ad684f505ed04039e3137dff3f8b2bb1d31d2a95a43c8e2462742e79a96c0e'
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

