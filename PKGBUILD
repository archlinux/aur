# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=last-resort
pkgver=0.2.1
pkgrel=1
pkgdesc="Tool for convincing Gearbox tags to work with the Xbox version of Halo."
depends=('invader')
makedepends=('cmake' 'ninja')
arch=('x86_64')
url="https://github.com/SnowyMouse/last-resort"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SnowyMouse/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f7e73981cdfa4b73d50be163ba34ebc9bfe7ad947165b805f12d7dbc774358a8')

prepare() {
	mkdir -p build
}

build() {
	cd "$srcdir"/build
	cmake ../$pkgname-$pkgver -G Ninja
	ninja
}

package() {
	cd "$srcdir"/build
	install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
