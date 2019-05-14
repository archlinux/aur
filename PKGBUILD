# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-community'
pkgver='1.17.0'
pkgrel='2'
pkgdesc='The official GUI for MongoDB - Community Edition'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
optdepends=('gnome-keyring' 'libgnome-keyring')
source=('https://downloads.mongodb.com/compass/mongodb-compass-community-1.17.0.x86_64.rpm')
sha256sums=('cc2b6497cc8b56328e17e982e0a0420c86d96a274bb6456ba48de0e980b09e7f')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-community"
	mv "$srcdir/usr/share/mongodb-compass-community/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-community"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
