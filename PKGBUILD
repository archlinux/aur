# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-community-beta'
pkgver='1.18.0beta.3'
pkgrel='2'
pkgdesc='The official GUI for MongoDB - Community Edition (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
optdepends=('gnome-keyring' 'libgnome-keyring')
source=('https://downloads.mongodb.com/compass/beta/mongodb-compass-community-beta-1.18.0-beta.3.x86_64.rpm')
sha256sums=('49e1d91680e178ec66644e773ab80bbe5b74e3e5ea4557522195dbdf7fab8dc8')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-community-beta"
	mv "$srcdir/usr/share/mongodb-compass-community-beta/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-community-beta"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
