# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-display"
pkgver="23.10.3"
pkgrel="1"
pkgdesc="Ayatana Indicator Display"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-display"
license=("GPL3")
depends=("xsct" "libayatana-common>=0.9.8" "geoclue" "hicolor-icon-theme" "glib2" "gcc-libs" "glibc" "dconf")
makedepends=("intltool" "cmake" "cmake-extras" "systemd" "properties-cpp")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("70ce1c4384bb912a1e7f0c36cea7352f")
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
