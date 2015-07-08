# Maintainer: xkero <sinister.ray@gmail.com>
pkgname=zenbooru
pkgver=0.4.0_1
pkgrel=1
pkgdesc='A standalone client for image boards that supports Gelbooru v0.2, Danbooru (v1 & v2), Moebooru, and booru.org sites.'
arch=(any)
url="http://zenbooru.org"
license=('GPL3')
depends=('chromium')
makedepends=()
install='zenbooru.install'
source=(
	"https://bitbucket.org/xkero/$pkgname/downloads/$pkgname-v$pkgver.zip"
	'icon.svg'
	'zenbooru.desktop'
	'zenbooru.sh'
)
sha256sums=('4cc8020de05f8117201d29e7c363fa3804fb407281d48b17aec7e551b09ad783'
            'b07caa8f83cdc615a97a346b7cfea91b9f673f97aab66052eac7142401b33581'
            '92a1f17e9b3546a6865e098feab63c28c2e5dbb0336053624e1454a7fb115414'
            '95165ed7a6e609b76578b6594c3aa3f1a35917ee8166f09011f6fd850471fe21')

package() {
	install -D     'zenbooru.sh'         "$pkgdir/usr/bin/zenbooru"
	install -Dm644 'icon.svg'            "$pkgdir/usr/share/icons/hicolor/scalable/apps/zenbooru.svg"
	install -Dm644 'zenbooru.desktop'    "$pkgdir/usr/share/applications/zenbooru.desktop"
	cd "$pkgname-v$pkgver"
	install -D     'Loading'             "$pkgdir/usr/share/zenbooru/index.html"
	install -D     'anyOS/commands.sh'   "$pkgdir/usr/share/zenbooru/anyOS/commands.sh"
	install -Dm644 'anyOS/background.js' "$pkgdir/usr/share/zenbooru/anyOS/background.js"
	install -Dm644 'anyOS/content.js'    "$pkgdir/usr/share/zenbooru/anyOS/content.js"
	install -Dm644 'anyOS/manifest.json' "$pkgdir/usr/share/zenbooru/anyOS/manifest.json"
	install -Dm644 'anyOS/commands.awk'  "$pkgdir/usr/share/zenbooru/anyOS/commands.awk"
	install -Dm644 'libs/hammer.min.js'  "$pkgdir/usr/share/zenbooru/libs/hammer.min.js"
}
