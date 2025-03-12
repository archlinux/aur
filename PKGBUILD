# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-display"
pkgver="24.5.1"
pkgrel="1"
pkgdesc="Ayatana Indicator Display"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-display"
license=("GPL-3.0-or-later")
depends=("xsct" "libayatana-common" "geoclue" "hicolor-icon-theme" "glib2" "gcc-libs" "glibc" "dconf" "accountsservice" "librda" "libx11" "libxrandr")
makedepends=("intltool" "cmake" "cmake-extras" "systemd" "properties-cpp")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("c83d122d311510bf33baee031f2624af")
conflicts=("redshift")

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
