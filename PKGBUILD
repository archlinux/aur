# Maintainer: Jean Schoeller <jean@schoeller.fr>



pkgname="iio-hyprland"

pkgver=1.0.1

pkgrel=3

pkgdesc="Reads iio-proxy-sensor output to enable automatic touchscreen rotation in Hyprland"

arch=("any")

depends=("iio-sensor-proxy")

makedepends=("meson")

licence="custom"

url="https://github.com/JeanSchoeller/iio-hyprland/"
source=(
    "${pkgname}::git+${url}"
)
sha1sums=(
    SKIP
)

prepare() {
    if [ ! -d "${pkgname}/build" ]; then
    mkdir ${pkgname}/build
    fi
}

build() {
    cd "$srcdir/$pkgname"
    meson setup build    
}

package() {
    cd ${pkgname}/build
    DESTDIR="${pkgdir}" ninja install
}



