# Maintainer: aspen <luxx4x@protonmail.com>

pkgname="apple-sdk-macos"
pkgver=10.15
pkgrel=1
arch=('any')
pkgdesc="macOS SDKs"
url="https://github.com/phracker/MacOSX-SDKs"
_rev="ef9fe35d5691b6dd383c8c46d867a499817a01b6"
license=('custom')
depends=()
install="sdk.install"
makedepends=('git' 'findutils')
source=("$pkgname::git+$url.git#commit=$_rev")
sha512sums=('SKIP')
options=(!strip)

prepare() {
	cd "$pkgname"
	find . -type f -name ".DS_Store" -delete
}

package() {
	mkdir -p "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/$pkgname"

	find "$pkgdir/opt/$pkgname/" -type f -exec chmod 644 {} \;
	chmod 755 "$pkgdir/opt/$pkgname"
}
