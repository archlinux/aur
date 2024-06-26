# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-bluetooth"
pkgver="24.5.0"
pkgrel="1"
pkgdesc="Ayatana system bluetooth indicator"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-bluetooth"
license=("GPL-3.0-or-later")
makedepends=("cmake-extras" "intltool" "systemd" "vala")
depends=("bluez" "blueman" "libayatana-common" "glibc" "glib2" "dconf")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("2ec07d43b33409b7b960340aa6e4924d")
options=("!emptydirs")

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
