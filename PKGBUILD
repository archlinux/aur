# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-readonly'
pkgver='1.17.0'
pkgrel='2'
pkgdesc='The official GUI for MongoDB - Readonly Edition'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
optdepends=('gnome-keyring' 'libgnome-keyring')
source=('https://downloads.mongodb.com/compass/mongodb-compass-readonly-1.17.0.x86_64.rpm')
sha256sums=('8081d5ce16e9810e4496d49ea5c6e377d7d8f23218fa8c5b70c754d612922e9e')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-readonly"
	mv "$srcdir/usr/share/mongodb-compass-readonly/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-readonly"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
