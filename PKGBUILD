# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-ido"
pkgver="0.8.2"
pkgrel="1"
pkgdesc="Ayatana Indicator Display Objects"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-ido"
license=("LGPL2.1" "LGPL3")
depends=("gtk3" "glib2")
makedepends=("mate-common" "gtk-doc" "gobject-introspection" "vala")
source=("https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver.tar.gz")
md5sums=("f72ce8fb7bdedf80c20d6083fa371e19")

prepare()
{
    cd "$pkgname-$pkgver"
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package()
{
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
