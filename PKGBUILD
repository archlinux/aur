# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-notifications"
pkgver="23.10.1"
pkgrel="1"
pkgdesc="Ayatana Indicator for viewing recent notifications"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-notifications"
license=("GPL-3.0-or-later")
makedepends=("intltool" "cmake-extras" "systemd")
depends=("dconf" "glib2" "glibc" "libayatana-common" "hicolor-icon-theme")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("c8e1766992f1706f9b0be7ad552888b7")

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

