# Maintainer: Nex Stuhlmüller <n at ncxy dot de>

_name=allo
pkgbase=${_name}
pkgname=(otf-${_name} woff2-${_name} ttf-${_name})
pkgver=1.1.1
pkgrel=1
pkgdesc='A friendly, free, and open source font family'
arch=(any)
url="https://github.com/joshpuckett/${_name}"
license=(OFL-1.1)
_archive=Allo-$pkgver
source=("$url/releases/download/v$pkgver/$_archive.zip")
sha256sums=('772977ae6b38d9de871ddd4d78e2ef75d3228db24ab7e7cc11d4f7dbabfdd2b1')

package_otf-allo() {
	cd "$_archive"
	provides=("$pkgbase=$pkgver" $pkgname-font)
	replaces=($pkgname-text)
	install -Dm0644 -t "$pkgdir/usr/share/fonts/Allo/OTF/" "fonts/otf/"*.otf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_woff2-allo() {
	cd "$_archive"
	provides=("$pkgbase=$pkgver" $pkgname-text)
	install -Dm0644 -t "$pkgdir/usr/share/fonts/Allo/WOFF2/" "fonts/webfonts/"*.woff2
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

package_ttf-allo() {
	cd "$_archive"
	provides=("$pkgbase=$pkgver" $pkgname-text)
	install -Dm0644 -t "$pkgdir/usr/share/fonts/Allo/WOFF2/" "fonts/variable/"*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
