# Maintainer: aspen <luxx4x@protonmail.com>

pkgname="apple-sdk-ios"
pkgver=13.4
pkgrel=2
arch=('any')
pkgdesc="iOS SDKs, from on DragonBuild's repository."
url="https://github.com/dragonbuild/sdks"
_rev="0bba3608a865c6e7a11054413de38e3579d70cbe"
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
