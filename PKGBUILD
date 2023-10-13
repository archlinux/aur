# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-session"
pkgver="23.10.0"
pkgrel="1"
pkgdesc="Ayatana Indicator showing session management, status and user switching"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-session"
license=("GPL2" "GPL3")
makedepends=("cmake-extras" "intltool")
depends=("glib2" "systemd" "dconf" "libayatana-common>=0.9.5" "hicolor-icon-theme" "librda")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("33bf6399ae740ca30a23dae6958725b6")

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
