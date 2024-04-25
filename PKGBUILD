# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-a11y"
pkgver="24.4.1"
pkgrel="1"
pkgdesc="Ayatana Indicator for Accessibility Settings"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-a11y"
license=("GPL-3.0-or-later")
makedepends=("cmake" "cmake-extras" "systemd" "intltool")
depends=("accountsservice" "glibc" "glib2" "onboard" "orca" "espeak-ng" "dconf" "magnus" "libayatana-common" "libx11" "libxrandr" "hicolor-icon-theme")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("85a528fc4131f6cb665d55fd23a35ede")

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


