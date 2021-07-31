# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=qahiri
pkgbase=$_fname-font
pkgname=(otf-$_fname) # ttf-$_fname $_fname-app
pkgver=3.00
pkgrel=2
pkgdesc='A manuscript Kufic typeface'
arch=(any)
url="https://aliftype.com/$_fname/"
license=(AGPL3)
provides=("$pkgbase")
source=("https://github.com/aliftype/$_fname/releases/download/v$pkgver/${_fname^}-$pkgver.zip")
sha256sums=('9458a1ec3917b034bcd7293f515624f253080bc4e996ed0c9190a7d01176e708')

package_otf-qahiri() {
	cd "${_fname^}-$pkgver"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README{,-Arabic}.txt
}

package_ttf-qahiri() {
	cd "${_fname^}-$pkgver"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF" *.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README{,-Arabic}.txt
}

pagkage_qahiri-app() {
	cd "${_fname^}-$pkgver"
	local _appdir="$pkgdir/usr/share/webapps/qaahiri/"
	install -dm0755 "$_appdir"
	cp -a app "$_appdir"
}
