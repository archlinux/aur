# Maintainer: Jean Schoeller <jean@schoeller.fr>


_pkgname="iio-hyprland"

pkgname="${_pkgname}-git"

pkgver=1.0.1

pkgrel=3

pkgdesc="Reads iio-proxy-sensor output to enable automatic touchscreen rotation in Hyprland"

arch=("any")

depends=("iio-sensor-proxy")

makedepends=("meson")

licence="custom"

url="https://github.com/JeanSchoeller/iio-hyprland/"
source=(
    "${_pkgname}::git+${url}"
)
sha1sums=(
    SKIP
)

prepare() {
    if [ ! -d "${_pkgname}/build" ]; then
    mkdir ${_pkgname}/build
    fi
}

build() {
    cd "$srcdir/$_pkgname"
    meson setup build    
}

package() {
    cd ${_pkgname}/build
    DESTDIR="${pkgdir}" ninja install
}



