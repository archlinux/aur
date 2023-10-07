# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-a11y"
pkgver="23.9.0"
pkgrel="1"
pkgdesc="Ayatana Indicator for Accessibility Settings"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-a11y"
license=("GPL3")
makedepends=("cmake" "cmake-extras" "systemd" "intltool")
depends=("accountsservice" "glibc" "glib2" "onboard" "orca" "espeak-ng")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("f39d081b7260035b30f1faacda3d2931")

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


