# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-session"
pkgver="24.5.0"
pkgrel="1"
pkgdesc="Ayatana Indicator showing session management, status and user switching"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-session"
license=("GPL-2.0-or-later" "GPL-3.0-or-later")
makedepends=("cmake-extras" "intltool")
depends=("glibc" "glib2" "systemd" "dconf" "libayatana-common" "hicolor-icon-theme" "librda" "glib2-devel")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("65adb16e5f0fd8798a9565a00a701f50")

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
