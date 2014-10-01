# Maintainer: Maxwell Anselm <silverhammermba+aur@gmail.com>

pkgname=gcs
pkgver=4.0.1
pkgrel=1
pkgdesc="An editor for building character sheets for the GURPS 4th Edition RPG system."
arch=('i686' 'x86_64')
url="http://gurpscharactersheet.com"
license=('MPL')
depends=('java-runtime')
src="gcs-$pkgver-linux"
if test "$CARCH" == i686; then
src+='-32'
fi
source=("${src}.zip::http://sourceforge.net/projects/gcs-java/files/${src}.zip/download")
md5sums=('SKIP')

package() {
	cp ${src}/gcs $pkgdir/usr/bin
	mkdir $pkgdir/usr/share/gcs
	cp -r ${src}/{Library,support} $pkdir/usr/share/gcs/
}
