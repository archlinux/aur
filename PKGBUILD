# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=plus-jakarta-sans
_proj=PlusJakartaSans
pkgbase=$_name-font
pkgname=(ttf-$_name ttf-$_name-variable)
pkgver=2.6
pkgrel=1
pkgdesc='an open-source font designed for Jakarta "City of collaboration" program in 2020'
arch=(any)
url="https://github.com/tokotype/$_proj"
license=(OFL)
_archive="$_proj-$pkgver"
source=("$url/releases/download/$pkgver/$_archive.zip")
sha256sums=('f1d21a6c99a5e7744574162dafc56e5c0895507fd9250ae04acbb1027733bee3')

package_ttf-plus-jakarta-sans() {
	provides=("$pkgbase")
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" static/*.ttf
}

package_ttf-plus-jakarta-sans-variable() {
	provides=("$pkgbase-variable")
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" vf/*.ttf
}
