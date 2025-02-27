# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Florian Loitsch <florian@toit.io>
pkgname=jaguar
pkgver=1.48.0
pkgrel=1
pkgdesc="Tool to develop Toit programs for the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/toitlang/jaguar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fb5a329ef5c166a791c84adf4a9c3c8003c974fe58384d428bde84baf1ec7493')

build() {
	cd "$pkgname-$pkgver"
	JAG_BUILD_RELEASE=1 make jag
}

package() {
	cd "$pkgname-$pkgver"
	install -D build/jag -t "$pkgdir/usr/bin/"
}
