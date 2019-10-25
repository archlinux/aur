# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-community-beta'
pkgver='1.20.0beta.8'
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Community Edition (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('electron3' 'libsecret')
optdepends=('gnome-keyring')
source=(
	'https://downloads.mongodb.com/compass/beta/mongodb-compass-community-beta-1.20.0-beta.8.x86_64.rpm'
	'launch.sh'
)
sha256sums=(
	'a7485021c328706da86df78c44ab0a0cd28f2ede6a84c32b16e73cb7f8ed378f'
	'efd6c487d077dbd7aaa1c8f5a29c86606842b3588d1b4fd26b57bc5e68ca7750'
)

package() {
	install -Dm644 "$srcdir/usr/share/mongodb-compass-community-beta/resources/app.asar" "$pkgdir/usr/lib/mongodb-compass-community-beta/app.asar"
	cp -r "$srcdir/usr/share/mongodb-compass-community-beta/resources/app.asar.unpacked/" "$pkgdir/usr/lib/mongodb-compass-community-beta/app.asar.unpacked/"
	install -Dm755 "$srcdir/launch.sh" "$pkgdir/usr/bin/mongodb-compass-community-beta"
	install -Dm644 "$srcdir/usr/share/mongodb-compass-community-beta/LICENSE" "$pkgdir/usr/share/licenses/mongodb-compass-community-beta/LICENSE"
	install -Dm644 "$srcdir/usr/share/mongodb-compass-community-beta/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/mongodb-compass-community-beta/LICENSES.chromium.html"
	install -Dm644 "$srcdir/usr/share/applications/mongodb-compass-community-beta.desktop" "$pkgdir/usr/share/applications/mongodb-compass-community-beta.desktop"
	install -Dm644 "$srcdir/usr/share/pixmaps/mongodb-compass-community-beta.png" "$pkgdir/usr/share/pixmaps/mongodb-compass-community-beta.png"
}
