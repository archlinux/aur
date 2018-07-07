# Maintainer: pigt <pay2630 at gmail dot com>
pkgname=todour
pkgver=2.02
pkgrel=1
pkgdesc="An application for handling todo.txt files."
arch=('any')
url="https://nerdur.com/todour-pl/"
license=('GPL')
depends=(qt5-base)
source=("https://nerdur.com/Todour-$pkgver.tar.gz", 'todour.desktop')
md5sums=('483c0d6e22bd672bb3d65be36b917096'
         '16e575ce3aa0e3c6301b1bba25ee4f62')

_dirname=Todour_dist

prepare() {
	#Rename according to packaging standard
	mv $_dirname/Todour $_dirname/todour
}

package() {
	mkdir -p $pkgdir/opt
	cp -r Todour_dist $pkgdir/opt/$pkgname

	mkdir -p $pkgdir/usr/bin
	ln -s /opt/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
	chmod 755 $pkgdir/opt/$pkgname/$pkgname

	mkdir -p $pkgdir/usr/share/applications
	install -m 755 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
