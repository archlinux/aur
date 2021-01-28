# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-notifications"
pkgver="0.8.90"
pkgrel="1"
pkgdesc="Ayatana Indicator for viewing recent notifications"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("libayatana-indicator" "glib2" "systemd")
makedepends=("intltool" "cmake" "cmake-extras" "glib2")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("c1197b1e1b8e10a9648937012b3b2812")
options=("!emptydirs")

build()
{
    cd ${pkgname}-${pkgver}
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib
    make
}

package()
{
    cd ${pkgname}-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}

