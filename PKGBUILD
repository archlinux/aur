# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=plus-jakarta-sans
_proj=PlusJakartaSans
pkgbase=$_name-font
pkgname=(ttf-$_name ttf-$_name-variable)
pkgver=2.4
pkgrel=1
pkgdesc='an open-source font designed for Jakarta "City of collaboration" program in 2020'
arch=('any')
url="https://github.com/tokotype/$_proj"
license=('OFL')
source=("$url/releases/download/$pkgver/$_proj-Fonts_$pkgver.zip")
sha256sums=('f3011f1d97161c19363b6e28453870fc219645a16aa93497484da7616b3c2c58')

package_ttf-plus-jakarta-sans() {
    provides=("$pkgbase")
	cd "$_proj-Fonts_$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
	cd "fonts/static"
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
}

package_ttf-plus-jakarta-sans-variable() {
    provides=("$pkgbase-variable")
	cd "$_proj-Fonts_$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
	cd "fonts/vf"
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
}
