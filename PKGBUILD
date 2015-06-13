# Contributor: Marco Curreli <marcocurreli@tiscali.it>
# Contributor: Ronny Steiner <post@sirsteiner.de>
# Contributor: Kyle Keen <keenerd@gmail.com>
# AUR Category: science

# this is really close to being x86_64
# there is a precompile IG/lib/IGlib.a that gets in the way

pkgname=varkon
pkgver=1.19E
pkgrel=1
pkgdesc="Powerful parametric 2D/3D CAD, modeling and application development tool"
arch=('i686')
url="http://varkon.sourceforge.net/"
license=('GPL')
depends=('xdialog')
source=(http://surfnet.dl.sourceforge.net/sourceforge/varkon/Varkon_sources_${pkgver}.tar.gz varkon)
md5sums=('cf8f013dcf10de554e1b8786a3fa0211'
         '9bcc588689d09a0dbd75176066e8e9a3')

build() {
	cd "$srcdir/Varkon_$pkgver/sources/"
	make
}

package() {
	cd "$srcdir/Varkon_$pkgver/sources/"
	mkdir -p "$pkgdir/opt"
	cp -r "$srcdir/Varkon_$pkgver" "$pkgdir/opt/varkon"

	install -Dm755 "$srcdir/varkon" "$pkgdir/usr/bin/varkon"
}
