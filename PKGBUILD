# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-keyboard"
pkgver="0.7.900"
pkgrel="1"
pkgdesc="Ayatana Indicator Keyboard Applet"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators"
license=("GPL3")
depends=("libayatana-indicator" "systemd" "glib2" "libxklavier")
makedepends=("intltool" "cmake" "cmake-extras" "glib2" "libx11" "libxklavier")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("01c24fa95c25227cc03dd30ebc7f8968")
options=("!emptydirs")

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}

