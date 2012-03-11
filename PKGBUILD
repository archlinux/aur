# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.12.1
pkgrel=1
pkgdesc="Gtk3 widget for displaying rasterized maps"
url="http://projects.gnome.org/libchamplain/"
license=('LGPL')
arch=('i686' 'x86_64')
options=('!libtool')
depends=('clutter-gtk' 'libsoup-gnome' 'cairo' 'sqlite3')
makedepends=('gobject-introspection' 'gtk-doc')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('ac51b31ae46d22e1f3200b0e897b18bc5af2832eed24125d2a20adbc1ac232a1')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr --disable-static --disable-debug
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
