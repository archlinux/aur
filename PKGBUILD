# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-isolated'
pkgver='1.14.7'
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Isolated Edition'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
optdepends=('gnome-keyring' 'libgnome-keyring')
source=('https://downloads.mongodb.com/compass/mongodb-compass-isolated-1.14.7.x86_64.rpm')
md5sums=('fed05fdf641268d2f7e0d7229f7656cc')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-isolated"
	mv "$srcdir/usr/share/mongodb-compass-isolated/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-isolated"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
