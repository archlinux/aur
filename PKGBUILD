# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-isolated'
pkgver='1.17.0'
pkgrel='2'
pkgdesc='The official GUI for MongoDB - Isolated Edition'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
optdepends=('gnome-keyring' 'libgnome-keyring')
source=('https://downloads.mongodb.com/compass/mongodb-compass-isolated-1.17.0.x86_64.rpm')
sha256sums=('21629e3382a7e4be24a2dffc0acf74d9d99502dc7931f4ee4606bc2a408928f6')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-isolated"
	mv "$srcdir/usr/share/mongodb-compass-isolated/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-isolated"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
