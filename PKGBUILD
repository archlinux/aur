# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=mada
pkgbase=$_fname-font
pkgname=ttf-$_fname-variable
pkgver=1.5
pkgrel=1
pkgdesc='A geometric, unmodulted Arabic display typeface'
arch=(any)
url="https://github.com/aliftype/$_fname"
license=(OFL)
provides=("$pkgbase")
source=("$url/releases/download/v$pkgver/${_fname^}-$pkgver.zip")
sha256sums=('349e87879f6813d12638e0c21f465b25f090b96209ec6627dd2d5574f0a1ea7d')

package_ttf-mada-variable() {
	cd "${_fname^}-$pkgver"
	provides=(${pkgname%-variable} otf-$_fname-variable)
	replaces=(${pkgname%-variable} otf-$_fname-variable)
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
