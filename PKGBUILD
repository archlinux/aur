# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.12.2
pkgrel=1
pkgdesc="Gtk3 widget for displaying rasterized maps"
url="http://projects.gnome.org/libchamplain/"
license=('LGPL')
arch=('i686' 'x86_64')
options=('!libtool')
depends=('clutter-gtk' 'libsoup-gnome' 'cairo' 'sqlite')
makedepends=('gobject-introspection' 'gtk-doc' 'vala')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('d23f97875e407fdc3e8fc86bef538a377c42f37f5be4fc8ec6063e7446fd7e2e')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr --disable-static --disable-debug --enable-vala
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
