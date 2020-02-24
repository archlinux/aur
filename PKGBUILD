# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=vimix-cursors
_pkgname=Vimix-cursors
pkgver=2020.02.24
_pkgver=2020-02-24
pkgrel=1
pkgdesc="An X Cursor theme inspired by Material design and based on capitaine-cursors"
arch=('any')
url="https://github.com/vinceliuice/Vimix-cursors"
license=('GPL3')
makedepends=('inkscape' 'xorg-xcursorgen')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('69298d02264b5b15239c340f8fa899f91574c0eac49ad5745e8e588315423618')

prepare() {
	cd "$_pkgname-$_pkgver"

	# Remove prebuilt assets
	rm -rf dist/
}

build() {
	cd "$_pkgname-$_pkgver"
	./build.sh
}

package() {
	cd "$_pkgname-$_pkgver"
	install -dm755 "$pkgdir/usr/share/icons/$pkgname"
	cp -dr --no-preserve=ownership dist/* "$pkgdir/usr/share/icons/$pkgname"
}
