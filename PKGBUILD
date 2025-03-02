# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-keyboard"
pkgver="24.7.2"
pkgrel="1"
pkgdesc="Ayatana Indicator Keyboard Applet"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-keyboard"
license=("GPL-3.0-or-later")
makedepends=("intltool" "cmake-extras" "systemd")
depends=("libayatana-common" "libxklavier" "hicolor-icon-theme" "accountsservice" "libxkbcommon" "dconf" "libx11" "glib2" "glibc")
optdepends=("matekbd-keyboard-display: Needed for displaying keyboard layouts on MATE" "libgnomekbd: Needed for displaying keyboard layouts on non-MATE")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("80d376592be6b3f37af390adb3768de6")

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

