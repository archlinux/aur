# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-community-beta'
pkgver='1.19.0beta.1'
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Community Edition (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk3' 'libsecret' 'libxss')
optdepends=('gnome-keyring')
source=('https://downloads.mongodb.com/compass/beta/mongodb-compass-community-beta-1.19.0-beta.1.x86_64.rpm')
sha256sums=('638d0f570ac0b27094ba42ab94b2d13744f4c6ace1528ffd3e68dca4408b0c59')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-community-beta"
	mv "$srcdir/usr/share/mongodb-compass-community-beta/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-community-beta"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
