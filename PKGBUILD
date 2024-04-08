# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-display"
pkgver="24.4.0"
pkgrel="1"
pkgdesc="Ayatana Indicator Display"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-display"
license=("GPL3")
depends=("xsct" "libayatana-common>=0.9.8" "geoclue" "hicolor-icon-theme" "glib2" "gcc-libs" "glibc" "dconf" "accountsservice")
makedepends=("intltool" "cmake" "cmake-extras" "systemd" "properties-cpp")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("f4d73251e11a9faa873f6d7693451126")
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
