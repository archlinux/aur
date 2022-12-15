# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-keyboard"
pkgver="22.9.1"
pkgrel="1"
pkgdesc="Ayatana Indicator Keyboard Applet"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-keyboard"
license=("GPL3")
makedepends=("intltool" "cmake-extras" "systemd" "glib2" "libx11")
depends=("libayatana-common>=0.9.5" "libxklavier" "hicolor-icon-theme" "accountsservice" "libxkbcommon")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("84b26a684e19ac8f1dfa4f1aa6bc4085")

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

