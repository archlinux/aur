# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Florian Loitsch <florian@toit.io>
pkgname=jaguar
pkgver=1.9.24
pkgrel=1
pkgdesc="Tool to develop Toit programs for the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/toitlang/jaguar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6990e2d89b3fbb71121655e980c13332edcf8f69338da9da4cf89f245e2e9bd1')

build() {
	cd "$pkgname-$pkgver"
	make jag
}

package() {
	cd "$pkgname-$pkgver"
	install -D build/jag -t "$pkgdir/usr/bin/"
}
