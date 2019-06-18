# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-beta'
pkgver='1.19.0beta.0'
pkgrel='1'
pkgdesc='The official GUI for MongoDB (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk3' 'libsecret' 'libxss')
optdepends=('gnome-keyring')
source=('https://downloads.mongodb.com/compass/beta/mongodb-compass-beta-1.19.0-beta.0.x86_64.rpm')
sha256sums=('6c769929b684505e48abcba0a5ce33fc589ae72b808f8547d9bab49e13a078c3')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-beta"
	mv "$srcdir/usr/share/mongodb-compass-beta/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-beta"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
