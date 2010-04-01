# Maintainer:  Ionut Biru <ibiru@archlinux.org
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>

_pkgsourcename=gtk2
pkgname=lib32-$_pkgsourcename
pkgver=2.20.0
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
md5sums=('ec04083830433744cafd7b9cd4f7784c'
         'b7275968c207facfd6d4edfd330b6224')
sha256sums=('97bbff82ab4662a659251e90c3b11db697128a862b3a46292dd270a2f08fa57f'
            '81c21ce1a13cf15765afff84f8b5e519916bd701b2d252ac7196b773db5d1d5d')
