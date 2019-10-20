# Maintainer: William Gathoye <william + aur at gathoye dot be>

pkgname=plasma5-applets-netspeed
pkgver=1.8
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
    'f7f7289df4338b351104b28bbc2de64ecf29a8ea0c2852cfe1230bb010de5d3ccbf86f02ff711342a2c11527db58c76303ee1477873d173deab234ff55ea2f2c'
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

