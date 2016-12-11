# Maintainer: Félix Saparelli <aur@passcod.name>
pkgname=exiftool
pkgver=10.36
pkgrel=1
pkgdesc="Read, write and edit meta information in a wide variety of images."
arch=('any')
url="http://www.sno.phy.queensu.ca/~phil/exiftool/"
license=('GPL-1.0' 'Artistic-1.0-Perl')
depends=('perl')
source=("http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-$pkgver.tar.gz")
sha512sums=('e6075755cd7510166995100459f80fb90d356c7a0d1073d414324c43386fa2487a28588e8035dbdb9815dc0b6df7044643916f85bfd68d659fb30f8350242685')

build() {
	cd "Image-ExifTool-$pkgver"
	perl Makefile.PL
	make
}

check() {
	cd "Image-ExifTool-$pkgver"
	make -k test
}

package() {
	cd "Image-ExifTool-$pkgver"
	make DESTDIR="$pkgdir/" install
}
