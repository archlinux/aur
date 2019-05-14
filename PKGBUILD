# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-beta'
pkgver='1.18.0beta.3'
pkgrel='2'
pkgdesc='The official GUI for MongoDB (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
optdepends=('gnome-keyring' 'libgnome-keyring')
source=('https://downloads.mongodb.com/compass/beta/mongodb-compass-beta-1.18.0-beta.3.x86_64.rpm')
sha256sums=('e35d6f19c817edb41ee4c6aa087d646ef194a14091407b62f57cdbb0573df92e')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-beta"
	mv "$srcdir/usr/share/mongodb-compass-beta/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-beta"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
