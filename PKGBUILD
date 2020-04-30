# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-session"
pkgver="0.4.4"
pkgrel="1"
pkgdesc="Ayatana Indicator showing session management, status and user switching"
arch=("i686" "x86_64")
url="https://github.com/AyatanaIndicators"
license=("GPL2" "GPL3")
depends=("libayatana-indicator-gtk3" "gsettings-desktop-schemas" "systemd" "glib2")
makedepends=("cmake" "intltool" "glib2" "systemd")
optdepends=("mate-screensaver" "mate-ayatana-indicator-applet" "mate-control-center" "yelp" "firefox")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("08b5488294dd380ebffde6422aa9b754")
options=("!emptydirs")

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib -Denable_tests=OFF
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
