# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-bluetooth"
pkgver="23.10.0"
pkgrel="1"
pkgdesc="Ayatana system bluetooth indicator"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-bluetooth"
license=("GPL3")
makedepends=("cmake-extras" "intltool" "glib2" "systemd" "vala" )
depends=("bluez" "blueman" "libayatana-common>=0.9.9")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("3a622c799f175472416e9be64cc409e6")
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
