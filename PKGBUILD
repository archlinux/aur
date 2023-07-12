# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-datetime"
pkgver="23.6.0"
pkgrel="1"
pkgdesc="Ayatana Indicator providing clock and calendar"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-datetime"
license=("GPL3")
makedepends=("cmake-extras" "ayatana-indicator-messages>=0.9.0" "intltool" "glib2" "libical" "properties-cpp")
depends=("libayatana-common>=0.9.5" "evolution-data-server" "libaccounts-glib")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("99664ac08ec27e2ae4a676b4324beffc")

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
