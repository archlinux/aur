# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-community'
pkgver='1.19.4'
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Community Edition'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('electron3' 'libsecret')
optdepends=('gnome-keyring')
source=(
	'https://downloads.mongodb.com/compass/mongodb-compass-community-1.19.4.x86_64.rpm'
	'launch.sh'
)
sha256sums=(
	'd8f6f1d4e816eade016e3f34d63bb0f40dc6bcebddc17f7e5fa59dc5916f4ccb'
	'69f68797ebf485b53e74af1f9f5f2e66d0f4e862ca94b90504d0fc85645e8b9d'
)

package() {
	install -Dm644 "$srcdir/usr/share/mongodb-compass-community/resources/app.asar" "$pkgdir/usr/lib/mongodb-compass-community/app.asar"
	cp -r "$srcdir/usr/share/mongodb-compass-community/resources/app.asar.unpacked/" "$pkgdir/usr/lib/mongodb-compass-community/app.asar.unpacked/"
	install -Dm755 "$srcdir/launch.sh" "$pkgdir/usr/bin/mongodb-compass-community"
	install -Dm644 "$srcdir/usr/share/mongodb-compass-community/LICENSE" "$pkgdir/usr/share/licenses/mongodb-compass-community/LICENSE"
	install -Dm644 "$srcdir/usr/share/mongodb-compass-community/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/mongodb-compass-community/LICENSES.chromium.html"
	install -Dm644 "$srcdir/usr/share/applications/mongodb-compass-community.desktop" "$pkgdir/usr/share/applications/mongodb-compass-community.desktop"
	install -Dm644 "$srcdir/usr/share/pixmaps/mongodb-compass-community.png" "$pkgdir/usr/share/pixmaps/mongodb-compass-community.png"
}
