# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-bluetooth"
pkgver="0.8.0"
pkgrel="1"
pkgdesc="Ayatana system bluetooth indicator"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
makedepends=("cmake" "cmake-extras" "intltool" "glib2" "systemd" "vala")
depends=("libayatana-indicator" "bluez" "blueman")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("b4be62ae0d54c0c5d818e0ca2557dd80")
options=("!emptydirs")

build()
{
    cd ${pkgname}-${pkgver}
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib
    make
}

package()
{
    cd ${pkgname}-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}
