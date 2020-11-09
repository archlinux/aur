# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=quick-lookup
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple GTK dictionary application powered by Wiktionary"
arch=('any')
url="https://github.com/johnfactotum/quick-lookup"
license=('GPL3')
depends=('gjs' 'webkit2gtk')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b292de88339e4f4cffbcd15701933c33d395fc6f877cd2176932a3ae70771355')

package() {
	_name='com.github.johnfactotum.QuickLookup'

	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname.js" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$_name.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$_name.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	install -Dm644 "$_name-symbolic.svg" -t \
		"$pkgdir/usr/share/icons/hicolor/symbolic/apps"
	install -Dm644 "$_name.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas"
}
