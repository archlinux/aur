# Maintainer:  Ionut Biru <ibiru@archlinux.org
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgsourcename=gtk2
pkgname=lib32-$_pkgsourcename
pkgver=2.20.1
pkgrel=1
pkgdesc="The GTK+ Toolkit (v2)"
arch=('x86_64')
url="http://www.gtk.org/"
license=('LGPL')
groups=('lib32')
depends=('lib32-libtiff' 'lib32-atk' 'lib32-pango' 'lib32-libxcursor' 'lib32-libxinerama' 'lib32-libxrandr' 'lib32-libxi' 'lib32-libcups' 'lib32-heimdal' 'lib32-openssl' 'lib32-pcre')
source=("http://mir.archlinux.fr/extra/os/i686/$_pkgsourcename-$pkgver-$pkgrel-i686.pkg.tar.xz" "gdk-pixbuf.loaders")

build() {
	cd $srcdir
	mkdir -p $pkgdir/opt/lib32/usr/lib/gtk-2.0/
	cp -dp usr/lib/*.so* $pkgdir/opt/lib32/usr/lib
	cp -RP usr/lib/gtk-2.0/2.* $pkgdir/opt/lib32/usr/lib/gtk-2.0/
	install -D -m644 $startdir/gdk-pixbuf.loaders $pkgdir/opt/lib32/config/gdk/gdk-pixbuf.loaders
}
md5sums=('ab935d585959d1e778baaec858ccaa99'
         '646d9ed93223fa70a01613f3e86f68b7')
sha256sums=('a6814a14e597654b0fd9ec9f3190a0a11a1a52d3cf155b93f05baa01eea8d412'
            '61f1517cfb89d0bec77047312a4850d23747c79c692fa47b04c51621aeae4b75')
