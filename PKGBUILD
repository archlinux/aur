# Maintainer:  Ionut Biru <ibiru@archlinux.org
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgsourcename=gtk2
pkgname=lib32-$_pkgsourcename
pkgver=2.18.9
pkgrel=2
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
md5sums=('356a12e70dc7396a1e84ed04909cebb9'
         'b7275968c207facfd6d4edfd330b6224')
sha256sums=('79c05145f48e9f7aabd0bb444615f9204be1a6a47cdc2809c41b2751739023f7'
            '81c21ce1a13cf15765afff84f8b5e519916bd701b2d252ac7196b773db5d1d5d')
