# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=vimix-cursors
_pkgname=Vimix-cursors
pkgver=2020.02.09
_pkgver=2020-02-09
pkgrel=1
pkgdesc="An X Cursor theme inspired by Material design and based on capitaine-cursors"
arch=('any')
url="https://github.com/vinceliuice/Vimix-cursors"
license=('GPL3')
makedepends=('git' 'inkscape' 'xorg-xcursorgen')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('99f9d13133a57f7dbc3584f0e8196f66d4dd245355d2ecf7a238d7c4ef90aa4c')

prepare() {
	cd "$_pkgname-$_pkgver"

	# Remove prebuilt assets
	rm -rf dist/
}

build() {
	cd "$_pkgname-$_pkgver"
	bash -e ./build.sh
}

package() {
	cd "$_pkgname-$_pkgver"
	install -dm755 "$pkgdir/usr/share/icons/$pkgname"
	cp -dr --no-preserve=ownership dist/* "$pkgdir/usr/share/icons/$pkgname"
}
