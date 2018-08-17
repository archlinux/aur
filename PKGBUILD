# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-community'
pkgver='1.14.7'
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Community Edition'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
optdepends=('gnome-keyring' 'libgnome-keyring')
source=('https://downloads.mongodb.com/compass/mongodb-compass-community-1.14.7.x86_64.rpm')
md5sums=('fec73a03ab84af9b522b1fcc8ea28a50')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-community"
	mv "$srcdir/usr/share/mongodb-compass-community/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-community"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
