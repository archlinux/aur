# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.12.4
pkgrel=1
pkgdesc="Gtk3 widget for displaying rasterized maps"
url="http://projects.gnome.org/libchamplain/"
license=('LGPL')
arch=('i686' 'x86_64')
options=('!libtool')
depends=('clutter-gtk' 'libsoup' 'cairo' 'sqlite')
makedepends=('gobject-introspection' 'gtk-doc' 'vala')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('631ce8e91b02c596e29778d3f7c1d28013e2e40d080a88f2d9a06f8b79f9e493')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr --disable-static --disable-debug --enable-vala
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
