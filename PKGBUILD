# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Florian Loitsch <florian@toit.io>
pkgname=jaguar
pkgver=1.22.1
pkgrel=2
pkgdesc="Tool to develop Toit programs for the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/toitlang/jaguar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4045c8121e214e9a5289701fa92b9db939ad4329bb54e71e6bf7d140422db20d')

build() {
	cd "$pkgname-$pkgver"
	JAG_BUILD_RELEASE=1 make jag
}

package() {
	cd "$pkgname-$pkgver"
	install -D build/jag -t "$pkgdir/usr/bin/"
}
