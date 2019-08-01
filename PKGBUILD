# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-isolated-beta'
pkgver='1.19.0beta.1'
pkgrel='2'
pkgdesc='The official GUI for MongoDB - Isolated Edition (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('electron3' 'libsecret')
optdepends=('gnome-keyring')
source=(
	'https://downloads.mongodb.com/compass/beta/mongodb-compass-isolated-beta-1.19.0-beta.1.x86_64.rpm'
	'launch.sh'
)
sha256sums=(
	'c4476956e1798023a3a762952798a591eedadd36eb1827e4989ee1838019783d'
	'c2c2797f4442fde3545d13f296a7307f46d0175cfef59f6848f1660a8a554851'
)

package() {
	install -Dm644 "$srcdir/usr/share/mongodb-compass-isolated-beta/resources/app.asar" "$pkgdir/usr/lib/mongodb-compass-isolated-beta/app.asar"
	cp -r "$srcdir/usr/share/mongodb-compass-isolated-beta/resources/app.asar.unpacked/" "$pkgdir/usr/lib/mongodb-compass-isolated-beta/app.asar.unpacked/"
	install -Dm755 "$srcdir/launch.sh" "$pkgdir/usr/bin/mongodb-compass-isolated-beta"
	install -Dm644 "$srcdir/usr/share/mongodb-compass-isolated-beta/LICENSE" "$pkgdir/usr/share/licenses/mongodb-compass-isolated-beta/LICENSE"
	install -Dm644 "$srcdir/usr/share/mongodb-compass-isolated-beta/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/mongodb-compass-isolated-beta/LICENSES.chromium.html"
	install -Dm644 "$srcdir/usr/share/applications/mongodb-compass-isolated-beta.desktop" "$pkgdir/usr/share/applications/mongodb-compass-isolated-beta.desktop"
	install -Dm644 "$srcdir/usr/share/pixmaps/mongodb-compass-isolated-beta.png" "$pkgdir/usr/share/pixmaps/mongodb-compass-isolated-beta.png"
}
