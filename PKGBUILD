# Maintainer: Nex Stuhlmüller <n at ncxy dot de>

_name=allo
pkgbase=${_name}
pkgname=(otf-${_name} woff2-${_name} ttf-${_name})
pkgver=1.1.0
pkgrel=1
pkgdesc='A friendly, free, and open source font family'
arch=(any)
url="https://github.com/joshpuckett/${_name}"
license=(OFL-1.1)
_archive=Allo-$pkgver
source=("$url/releases/download/v$pkgver/$_archive.zip")
sha256sums=('fe3d70e07fda3c4e3590b27367cf0b8603d84e7f926334dbe095020ced381472')

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
