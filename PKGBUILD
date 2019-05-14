# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-readonly-beta'
pkgver='1.18.0beta.3'
pkgrel='2'
pkgdesc='The official GUI for MongoDB - Readonly Edition (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
optdepends=('gnome-keyring' 'libgnome-keyring')
source=('https://downloads.mongodb.com/compass/beta/mongodb-compass-readonly-beta-1.18.0-beta.3.x86_64.rpm')
sha256sums=('a1ee70b3ce80503664a1ac1ba2bda6fe7bff9ccccf9fb05d108395c4a6d513ae')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-readonly-beta"
	mv "$srcdir/usr/share/mongodb-compass-readonly-beta/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-readonly-beta"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
