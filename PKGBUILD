# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=plus-jakarta-sans
_proj=PlusJakartaSans
pkgbase=$_name-font
pkgname=(ttf-$_name ttf-$_name-variable)
pkgver=2.5
pkgrel=1
pkgdesc='an open-source font designed for Jakarta "City of collaboration" program in 2020'
arch=('any')
url="https://github.com/tokotype/$_proj"
license=('OFL')
source=("$url/releases/download/$pkgver/${_proj/S/_S}-$pkgver.zip")
sha256sums=('2fe3d054a783dda24957d41348d5f52b151c99d3f530eca8ed2fa6f327b64540')

package_ttf-plus-jakarta-sans() {
    provides=("$pkgbase")
	cd "${_proj/S/_S}-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" static/*.ttf
}

package_ttf-plus-jakarta-sans-variable() {
    provides=("$pkgbase-variable")
	cd "${_proj/S/_S}-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" vf/*.ttf
}
