# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Evan Oicle <oicleevan@protonmail.com>
pkgname=the-deeps
pkgver=1.2.1
pkgrel=1
pkgdesc="A C++ text-based adventure game."
arch=('any')
url="https://github.com/oicleevan/the-deeps"
license=('MIT')
source=("https://github.com/oicleevan/$pkgname/archive/refs/tags/$pkgver.zip")
md5sums=("1b063eab21d8b355a98b956737259162")

build() {
	cd "$pkgname-$pkgver/src/libeo"
	make
	cd "../.."
	make
}

package() {
	cd "$pkgname-$pkgver"
	sudo make install
}
