# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Note upstream project keeps flip-flopping whith font format is released,
# and each release only has one option, so the upgrade path has changed
# package names twice now.

_fname=qahiri
pkgbase=$_fname-font
pkgname=(ttf-$_fname) # otf-$_fname $_fname-app
pkgver=4.00
pkgrel=1
pkgdesc='A manuscript Kufic typeface'
arch=(any)
url="https://aliftype.com/$_fname/"
license=(OFL-1.1-no-RFN)
provides=("$pkgbase")
source=("https://github.com/aliftype/$_fname/releases/download/v$pkgver/${_fname^}-$pkgver.zip")
sha256sums=('850c7f4a92fc43551c952abd216d561c2f0f61ef72f1d85616266ab877c95d09')

package_otf-qahiri() {
	cd "${_fname^}-$pkgver"
	replaces=(ttf-qahiri)
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README{,-Arabic}.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-qahiri() {
	cd "${_fname^}-$pkgver"
	replaces=(otf-qahiri)
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF" *.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README{,-Arabic}.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

pagkage_qahiri-app() {
	cd "${_fname^}-$pkgver"
	local _appdir="$pkgdir/usr/share/webapps/qaahiri/"
	install -dm0755 "$_appdir"
	cp -a app "$_appdir"
}
