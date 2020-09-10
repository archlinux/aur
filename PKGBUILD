# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-power"
pkgver="2.1.1"
pkgrel="1"
pkgdesc="Ayatana Indicator showing power state"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators"
license=("GPL2" "GPL3")
depends=("libayatana-indicator" "upower" "systemd" "libnotify" "dconf")
makedepends=("cmake" "cmake-extras" "libnotify" "glib2" "python")
optdepends=("zenity")
source=("https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("c11754a834f5461eaba3135fd2df0156")
options=("!emptydirs")

build()
{
    cd ${pkgname}-${pkgver}
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib -Denable_tests=OFF
    make
}

package()
{
    cd ${pkgname}-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}
