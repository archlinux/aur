# $Id: PKGBUILD,v 1.22 2009/06/23 12:49:29 wonder Exp $
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Maintainer: Mikko Seppälä <t-r-a-y@mbnet.fi>
_pkgsourcename=gtk2
pkgname=lib32-$_pkgsourcename
pkgver=2.16.2
pkgrel=1
pkgdesc="The GTK+ Toolkit (v2)"
arch=(x86_64)
url="http://www.gtk.org/"
license=('LGPL')
groups=('lib32')
depends=('lib32-libtiff' 'lib32-atk' 'lib32-pango' 'lib32-libxcursor' 'lib32-libxinerama' 'lib32-libxrandr' 'lib32-libxi' 'lib32-libcups' 'lib32-heimdal' 'lib32-openssl' 'lib32-pcre')
source=("ftp://ftp.heanet.ie/mirrors/ftp.archlinux.org/extra/os/i686/$_pkgsourcename-$pkgver-$pkgrel-i686.pkg.tar.gz" "gdk-pixbuf.loaders")

build() {
	cd $startdir/src
	mkdir -p $startdir/pkg/opt/lib32/usr/lib/gtk-2.0/
	cp -dp usr/lib/*.so* $startdir/pkg/opt/lib32/usr/lib
	cp -RP usr/lib/gtk-2.0/2.* $startdir/pkg/opt/lib32/usr/lib/gtk-2.0/
	install -D -m644 $startdir/gdk-pixbuf.loaders $startdir/pkg/opt/lib32/config/gdk/gdk-pixbuf.loaders
}
md5sums=('87575502b4899dc26adac4dcc40f507d'
         'a27d18250ece707c802d49ee652175e3')
