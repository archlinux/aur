# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=plus-jakarta-sans
_proj=PlusJakartaSans
pkgbase=$_name-font
pkgname=(ttf-$_name ttf-$_name-variable)
pkgver=2.7.1
pkgrel=2
pkgdesc='an open-source font designed for Jakarta "City of collaboration" program in 2020'
arch=(any)
url="https://github.com/tokotype/$_proj"
license=(OFL)
_archive="$_proj-$pkgver"
source=("$_archive-$pkgrel.zip::$url/releases/download/$pkgver/$_archive.zip")
sha256sums=('4bfc5cdf97d750423bb3d1d40ed8e529bc92288924d9c65e18ff486acefac66c')

package_ttf-plus-jakarta-sans() {
	provides=("$pkgbase")
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" ttf/*.ttf
}

package_ttf-plus-jakarta-sans-variable() {
	provides=("$pkgbase-variable")
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" variable/*.ttf
}
