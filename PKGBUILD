# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-bluetooth"
pkgver="22.9.1"
pkgrel="1"
pkgdesc="Ayatana system bluetooth indicator"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-bluetooth"
license=("GPL3")
makedepends=("cmake-extras" "intltool" "glib2" "systemd" "vala" )
depends=("bluez" "blueman" "libayatana-common>=0.9.5")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("d168da67f12e49e8cca9f1f7404b016e")
options=("!emptydirs")

build()
{
    cd ${pkgname}-${pkgver}
    cmake -S . -B build -DCMAKE_INSTALL_LIBEXECDIR='lib'
    cmake --build build
}

package()
{
    cd ${pkgname}-${pkgver}
    DESTDIR="${pkgdir}" cmake --install build
}
