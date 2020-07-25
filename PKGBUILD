# Maintainer: Robert Tari <robert at tari dot in>
# Contributor: Valentin Huélamo <vhuelamo at gmail dot com>

pkgname="ayatana-indicator-power"
pkgver="2.0.95"
pkgrel="1"
pkgdesc="Ayatana Indicator showing power state"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators"
license=("GPL2" "GPL3")
depends=("libayatana-indicator" "upower" "systemd" "libnotify" "dconf")
makedepends=("cmake" "cmake-extras" "libnotify" "glib2" "python")
optdepends=("mate-ayatana-indicator-applet" "zenity" "mate-control-center" "mate-power-manager")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("fb07dee2f4b2567d4ab45b0d7075d551")
options=("!emptydirs")

build()
{
    cd ${pkgname}-${pkgver}
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib -Denable_tests=OFF
    make
}

package()
{
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
