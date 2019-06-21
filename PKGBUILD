# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-isolated-beta'
pkgver='1.19.0beta.1'
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Isolated Edition (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk3' 'libsecret' 'libxss')
optdepends=('gnome-keyring')
source=('https://downloads.mongodb.com/compass/beta/mongodb-compass-isolated-beta-1.19.0-beta.1.x86_64.rpm')
sha256sums=('c4476956e1798023a3a762952798a591eedadd36eb1827e4989ee1838019783d')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-isolated-beta"
	mv "$srcdir/usr/share/mongodb-compass-isolated-beta/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-isolated-beta"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
