# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-printers"
pkgver="23.10.1"
pkgrel="1"
pkgdesc="Ayatana Indicator showing active print jobs"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-printers"
license=("GPL-3.0-or-later")
depends=("cups" "libayatana-common" "libcups" "glib2" "glibc")
makedepends=("intltool" "cmake-extras" "systemd")
optdepends=("system-config-printer")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("91ad17779b67e80e75d5357cb6f6f6ef")

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
