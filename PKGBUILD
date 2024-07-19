# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-datetime"
pkgver="24.1.0"
pkgrel="1"
pkgdesc="Ayatana Indicator providing clock and calendar"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-datetime"
license=("GPL-3.0-or-later")
makedepends=("cmake-extras" "intltool" "properties-cpp" "glib2-devel")
depends=("gstreamer" "util-linux-libs" "libayatana-common" "evolution-data-server" "libaccounts-glib" "libical" "glib2" "dconf" "gcc-libs" "glibc" "libnotify" "ayatana-indicator-messages")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("4192b112491e7293c4d398572f0c998a")

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
