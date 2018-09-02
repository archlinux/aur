# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-community'
pkgver='1.15.1'
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Community Edition'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
optdepends=('gnome-keyring' 'libgnome-keyring')
source=('https://downloads.mongodb.com/compass/mongodb-compass-community-1.15.1.x86_64.rpm')
md5sums=('3de3fe329de47a10f2cde6583238bdad')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-community"
	mv "$srcdir/usr/share/mongodb-compass-community/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-community"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
