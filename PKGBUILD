# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>

pkgname="odio-edit"
pkgver="23.12.1"
pkgrel="1"
pkgdesc="A lightweight audio wave editor"
arch=("i686" "x86_64" "pentium4")
url="https://tari.in/www/software/odio-edit"
license=("GPL3")
depends=("gstreamer" "gst-plugins-base-libs" "pango" "gtk3" "dconf" "glib2" "glibc" "cairo" "hicolor-icon-theme" "gst-plugins-good" "gst-plugins-bad" "gst-plugins-ugly" "gst-libav" "libodiosacd")
makedepends=("cmake" "cmake-extras" "gsettings-desktop-schemas")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tari01/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("bd3dc26faedcd6d7d882ec060570dc36")

build()
{
    cd ${pkgname}-${pkgver}
    cmake -S . -B build
    cmake --build build
}

package()
{
    cd ${pkgname}-${pkgver}
    DESTDIR="${pkgdir}" cmake --install build
}
