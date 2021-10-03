# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Evan Oicle <oicleevan@protonmail.com>
pkgname=the-deeps
pkgver=1.2.1
pkgrel=1
pkgdesc="A text-based adventure game written in C++."
arch=('any')
url="https://github.com/oicleevan/the-deeps"
license=('MIT')
source=("https://github.com/oicleevan/$pkgname/archive/refs/tags/$pkgver.zip")
sha256sums=('d5a6fe6631f0dadc60fe06d3da6da54cb7792cdd69788b8166a65bb3cf2bc93a')

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
