# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-beta'
pkgver='1.15.0beta.3'
pkgrel='1'
pkgdesc='The official GUI for MongoDB (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
optdepends=('gnome-keyring' 'libgnome-keyring')
source=('https://downloads.mongodb.com/compass/beta/mongodb-compass-beta-1.15.0-beta.3.x86_64.rpm')
md5sums=('918e08aad08b2e445d4f54fa78045246')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-beta"
	mv "$srcdir/usr/share/mongodb-compass-beta/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-beta"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
