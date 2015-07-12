# Maintainer: Evan Anderson <evananderson@thelinuxman.us>
# Contributor: David Rosenstrauch <darose@darose.net>
pkgname=fontconfig-ttf-ms-fonts
pkgver=1.0
pkgrel=2
pkgdesc="Enhanced font configuration for ttf-ms-fonts.  (Prefer Microsoft versions of PostScript fonts.)"
arch=('any')
url="http://corefonts.sourceforge.net/"
license=('GPL')
depends=('ttf-ms-fonts' 'fontconfig')
source=('29-replace-bitmap-fonts.conf')
md5sums=('39654873d8ff74d418f533e559b57fb9')
install=fontconfig-ttf-ms-fonts.install

package() {
	cd "$srcdir"
	install -d -m755 $pkgdir/etc/fonts/conf.avail
	install -d -m755 $pkgdir/etc/fonts/conf.d
	install -D -m644 29-replace-bitmap-fonts.conf $pkgdir/etc/fonts/conf.avail/29-replace-bitmap-fonts.conf
	cd $pkgdir/etc/fonts/conf.d
	ln -s ../conf.avail/29-replace-bitmap-fonts.conf
}
