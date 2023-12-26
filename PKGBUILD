# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-keyboard"
pkgver="23.10.2"
pkgrel="1"
pkgdesc="Ayatana Indicator Keyboard Applet"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-keyboard"
license=("GPL3")
makedepends=("intltool" "cmake-extras" "systemd" "glib2" "libx11")
depends=("libayatana-common>=0.9.9" "libxklavier" "hicolor-icon-theme" "accountsservice" "libxkbcommon")
optdepends=("matekbd-keyboard-display: Needed for displaying keyboard layouts on MATE" "libgnomekbd: Needed for displaying keyboard layouts on non-MATE")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("b1a06866d7892acdd113d27d6bc958fc")

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

