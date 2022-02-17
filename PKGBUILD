# Maintainer: Robert Tari <robert at tari dot in>

pkgname="libayatana-indicator"
pkgver="0.9.1"
pkgrel="1"
pkgdesc="Ayatana Indicators (Shared Library)"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/libayatana-indicator"
license=("LGPL2.1" "LGPL3")
makedepends=("cmake-extras" "gobject-introspection" "vala")
depends=("gtk3" "glib2" "ayatana-ido>=0.9.0")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver.tar.gz")
md5sums=("b7a7fd24a749cb384431b8309db65a58")
conflicts=("${pkgname}-gtk3")
replaces=("${pkgname}-gtk3")

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
