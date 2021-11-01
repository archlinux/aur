# Maintainer: Robert Tari <robert at tari dot in>

pkgname="libayatana-common"
pkgver="0.9.5"
pkgrel="1"
pkgdesc="Ayatana System Indicators' common API functions"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/libayatana-common"
license=("GPL3")
makedepends=("cmake" "cmake-extras" "glib2" "vala" "gobject-introspection" "intltool")
depends=("dconf")
source=("https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver.tar.gz")
md5sums=("b4a49f2a305ffd69d9db99fa74e61c80")

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
