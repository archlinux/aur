# Maintainer: Robert Tari <robert at tari dot in>

pkgname="libayatana-appindicator"
pkgver="0.5.91"
pkgrel="1"
pkgdesc="Ayatana Application Indicators (Shared Library)"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/libayatana-appindicator"
license=("LGPL2.1" "LGPL3")
makedepends=("cmake-extras" "glib2" "gtk3" "gobject-introspection" "vala" "mono" "gtk-sharp-3" "perl-xml-libxml")
depends=("libdbusmenu-gtk3" "libayatana-indicator>=0.9.0")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver.tar.gz")
md5sums=("6828e6a99df1d64ea222421167406f63")
conflicts=("${pkgname}-gtk3")
replaces=("${pkgname}-gtk3")

build()
{
    cd ${pkgname}-${pkgver}
    mkdir build
    cd build
    cmake .. -DENABLE_GTKDOC=ON
    make
}

package()
{
    cd ${pkgname}-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}

