# Maintainer: Jesse McClure aka "Trilby" <jesse dot mcclure at umassmed dot edu>

pkgname=qt5-webengine-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=61.0.3163.100
_widevine_ver=1.4.8.1008
pkgrel=2
epoch=1
arch=('x86_64')
url='http://www.google.com/chrome'
license=('custom:chrome')
options=('!strip')
depends=('qt5-webengine')
source=(
	"https://archive.archlinux.org/packages/c/chromium/chromium-${pkgver}-1-x86_64.pkg.tar.xz"
	"https://dl.google.com/widevine-cdm/${_widevine_ver}-linux-x64.zip"
	"chrome-eula_text.html::https://www.google.com/intl/en/chrome/browser/privacy/eula_text.html"
)
sha256sums=(
	'5d4380308b3d5c2bc6e13d77090688ba00f0828f2777d83376d44038a6d0e2dd'
	'fe04a5b56eac6674f1eda2c8eb28a0183ec1a66d80f72db618291e33078eb17d'
	'e93c01576427cad9099f2cf0df0be70d0a2cc0a3a66c743318b2138aa7c4ed93'
)

package() {
	install -Dm644 libwidevinecdm.so -t "$pkgdir/usr/lib/qt/plugins/ppapi/"
	install -Dm644 usr/lib/chromium/libwidevinecdmadapter.so -t "$pkgdir/usr/lib/qt/plugins/ppapi/"
	install -Dm644 chrome-eula_text.html -t "$pkgdir/usr/share/licenses/$pkgname/"
}
