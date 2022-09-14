# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-datetime"
pkgver="22.9.0"
pkgrel="1"
pkgdesc="Ayatana Indicator providing clock and calendar"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-datetime"
license=("GPL3")
makedepends=("cmake-extras" "ayatana-indicator-messages>=0.9.0" "intltool" "glib2" "libical" "properties-cpp")
depends=("libayatana-common>=0.9.5" "evolution-data-server" "libaccounts-glib")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("5b1b43661655c87bd6eaf42aad8c23fb")

build()
{
    cd ${pkgname}-${pkgver}
    mkdir build
    cd build
    cmake ..
    make
}

package()
{
    cd ${pkgname}-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}
