# Maintainer: Megameneer (Dennis Holierhoek) <dennis.hh@hotmail.com>
pkgname=gimp-dds
pkgver=3.0.1
pkgrel=4
pkgdesc="A plugin for the GIMP version 2.8. It allows you to load and save images in the Direct Draw Surface (DDS) format"
arch=('any')
url=https://code.google.com/p/gimp-dds
license=('GPL2')
depends=('gimp>=2.8.x' 'glib2' 'gtk2' 'pango' 'atk')
makedepends=('pkg-config')
source=(https://gimp-dds.googlecode.com/files/gimp-dds-3.0.1.tar.bz2)
md5sums=('19a0310e97b93d836beb3239fa0cbd63')
sha256sums=('6e53df3b8b98c55f22fa7ea2c3ed17478626c924b24c69d499f5d813c3c2788a')

build() {
	cd gimp-dds-$pkgver
	make
}

package() {
	cd "$srcdir"/gimp-dds-"$pkgver"
	install -dm755 "$pkgdir"/usr/lib/gimp/2.0/plug-ins/
	cp dds "$pkgdir"/usr/lib/gimp/2.0/plug-ins
	chmod 755 "$pkgdir"/usr/lib/gimp/2.0/plug-ins/dds
}
