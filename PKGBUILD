# Maintainer: tee < teeaur at duck dot com >
_pkg=focus
pkgname=focus-bin
pkgver=0.2.0
pkgrel=2
pkgdesc='A simple and fast text editor'
arch=(x86_64)
url="https://github.com/focus-editor/focus"
license=('GPL-3.0')
provides=('focus')
conflicts=('focus')
source=("focus.desktop"
		"$url/raw/$pkgver/LICENSE"
		"https://github.com/focus-editor/focus/raw/$pkgver/images/linux-icon.png")
source_x86_64=("$_pkg-$pkgver::$url/releases/download/$pkgver/focus-linux")
sha256sums=('00bab3a9bf46741454e88d41bfd9f1460d1c1e05d603a27aff41f85de43f64b4'
            '8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b'
            'd9aa84d9e7678a75a832d96b3967f9a94f36c07b6b73bb277cc9cbe9e08e0eae')
sha256sums_x86_64=('a0ff79f21999e26d072299f8d81d8dd45446f5f3901a3cfd4cd444c01a4e1107')

package() {
	install -Dm0755 "$_pkg-$pkgver" "$pkgdir/usr/bin/$_pkg"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 focus.desktop "$pkgdir"/usr/share/applications/focus.desktop
	install -Dm755 linux-icon.png "$pkgdir"/usr/share/pixmaps/focus.svg
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
