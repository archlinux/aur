# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=mada
pkgbase=$_fname-font
pkgname=(otf-$_fname-variable ttf-$_fname-variable)
pkgver=1.4
pkgrel=1
pkgdesc='A geometric, unmodulted Arabic display typeface'
arch=(any)
url="https://github.com/aliftype/$_fname"
license=(OFL)
provides=("$pkgbase")
source=("$url/releases/download/v$pkgver/${_fname^}-$pkgver.zip")
sha256sums=('eec40cc041a59b2bea2a2afdb3fc6caba5cc30b2816435f3ef3274fd3c340971')

package_otf-mada-variable() {
	cd "${_fname^}-$pkgver"
	provides=(${pkgname%-variable})
	replaces=(${pkgname%-variable})
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

package_ttf-mada-variable() {
	cd "${_fname^}-$pkgver"
	provides=(${pkgname%-variable})
	replaces=(${pkgname%-variable})
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" ttf/*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
