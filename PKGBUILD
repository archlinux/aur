# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-isolated'
pkgver='1.18.0'
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Isolated Edition'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
optdepends=('gnome-keyring' 'libgnome-keyring')
source=('https://downloads.mongodb.com/compass/mongodb-compass-isolated-1.18.0.x86_64.rpm')
sha256sums=('a5413c5c42e24181bd965d24c006e05ee8bb1fba5beef17588628ea503dfafcf')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-isolated"
	mv "$srcdir/usr/share/mongodb-compass-isolated/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-isolated"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
