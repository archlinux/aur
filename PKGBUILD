# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=mktiupgrade
pkgver=1.1.4
pkgrel=1
license=('MIT')
pkgdesc='Builds and signs OS upgrades for Texas Instruments calculators'
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/mktiupgrade'
source=("https://github.com/KnightOS/mktiupgrade/archive/${pkgver}.tar.gz")
sha256sums=('7b02c6eac77e641fdab196fa4f88ee4fb791ae92d1a518767080f92941823bd4')

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" make install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
