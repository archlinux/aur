# Maintainer: Biru Ionut <ionut@archlinux.ro>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgsourcename=gtk2
pkgname=lib32-$_pkgsourcename
pkgver=2.18.3
pkgrel=3
pkgdesc="The GTK+ Toolkit (v2)"
arch=('x86_64')
url="http://www.gtk.org/"
license=('LGPL')
groups=('lib32')
depends=('lib32-libtiff' 'lib32-atk' 'lib32-pango' 'lib32-libxcursor' 'lib32-libxinerama' 'lib32-libxrandr' 'lib32-libxi' 'lib32-libcups' 'lib32-heimdal' 'lib32-openssl' 'lib32-pcre')
source=("http://mir.archlinux.fr/extra/os/i686/$_pkgsourcename-$pkgver-$pkgrel-i686.pkg.tar.gz" "gdk-pixbuf.loaders")

build() {
	cd $srcdir
	mkdir -p $pkgdir/opt/lib32/usr/lib/gtk-2.0/
	cp -dp usr/lib/*.so* $pkgdir/opt/lib32/usr/lib
	cp -RP usr/lib/gtk-2.0/2.* $pkgdir/opt/lib32/usr/lib/gtk-2.0/
	install -D -m644 $startdir/gdk-pixbuf.loaders $pkgdir/opt/lib32/config/gdk/gdk-pixbuf.loaders
}
sha256sums=('be5deef514f9ee97103af17bfe58f124dfcf9b5452d455ae9a7707940694f93b'
            '6e5c50c2cba2a455149920c93af6e88d0a0efb9d8f17095d11fcc6fbf0cce007')
