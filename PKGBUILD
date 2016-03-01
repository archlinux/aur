# $Id$
# Previous Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=gtkhtml4
_pkgbasename=gtkhtml
pkgver=4.10.0
pkgrel=1
pkgdesc="A lightweight HTML renderer/editor widget for GTK3"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk3' 'enchant' 'iso-codes' 'libsoup')
makedepends=('intltool')
url="http://www.gnome.org"
source=(https://download.gnome.org/sources/$_pkgbasename/${pkgver:0:4}/$_pkgbasename-$pkgver.tar.xz)
sha256sums=('ca3b6424fb2c7ac5d9cb8fdafb69318fa2e825c9cf6ed17d1e38d9b29e5606c3')

build() {
    cd "$_pkgbasename-$pkgver"
    ./configure --prefix=/usr --sysconfdir=/etc \
        --libexecdir=/usr/lib/gtkhtml4 \
        --localstatedir=/var --disable-static
    make
}

package() {
    cd "$_pkgbasename-$pkgver"
    make DESTDIR="$pkgdir" install
}

