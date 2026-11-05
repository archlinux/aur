# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=mada
pkgbase=$_fname-font
pkgname=ttf-$_fname-variable
pkgver=1.6
pkgrel=1
pkgdesc='A geometric, unmodulted Arabic display typeface'
arch=(any)
url="https://github.com/aliftype/$_fname"
license=(OFL)
provides=("$pkgbase")
source=("$url/releases/download/v$pkgver/${_fname^}-$pkgver.zip")
sha256sums=('b40a1078ca557a9797ed54464c3fe27142e6ac7f14a8e052672bcd909a436ee6')

package_ttf-mada-variable() {
	cd "${_fname^}-$pkgver"
	provides=(${pkgname%-variable} otf-$_fname-variable)
	replaces=(${pkgname%-variable} otf-$_fname-variable)
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
