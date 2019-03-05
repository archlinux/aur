# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-isolated-beta'
pkgver='1.18.0beta.1'
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Isolated Edition (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
optdepends=('gnome-keyring' 'libgnome-keyring')
source=('https://downloads.mongodb.com/compass/beta/mongodb-compass-isolated-beta-1.18.0-beta.1.x86_64.rpm')
md5sums=('279031d1c12bd90e91b3c86123d26528')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-isolated-beta"
	mv "$srcdir/usr/share/mongodb-compass-isolated-beta/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-isolated-beta"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
