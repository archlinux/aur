# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-display"
pkgver="22.9.3"
pkgrel="1"
pkgdesc="Ayatana Indicator Display"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-display"
license=("GPL3")
depends=("xsct" "libayatana-common")
makedepends=("intltool" "cmake-extras" "glib2" "systemd" "hicolor-icon-theme")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("220600fe813c997a7a73dc3cb06ae718")

build()
{
    cd ${pkgname}-${pkgver}
    cmake -S . -B build
    cmake --build build
}

package()
{
    cd ${pkgname}-${pkgver}
    DESTDIR="${pkgdir}" cmake --install build
}
