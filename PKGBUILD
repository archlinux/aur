# Maintainer: Robert Tari <robert at tari dot in>

pkgname="libayatana-appindicator-glib"
pkgver="2.0.0"
pkgrel="1"
pkgdesc="Ayatana Application Indicators Shared Library (GLib-2.0 reimplementation, 100% GTK-free, 100% dbusmenu-free)"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/libayatana-appindicator-glib"
license=("GPL-3.0-or-later")
makedepends=("cmake-extras" "gi-docgen" "gobject-introspection" "vala" "glib2-devel")
depends=("glibc" "gcc-libs" "glib2")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver.tar.gz")
md5sums=("f5ae0033a87d5198b9ce956b6e0a6360")

build()
{
    cd ${pkgname}-${pkgver}
    cmake -S . -B build
    cmake --build build
}

package()
{
    cd ${pkgname}-${pkgver}
    DESTDIR="${pkgdir}" cmake --install build
}

