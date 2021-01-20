# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=last-resort
pkgver=0.2.0
pkgrel=1
pkgdesc="Tool for convincing Gearbox tags to work with the Xbox version of Halo."
depends=('invader')
makedepends=('cmake' 'ninja')
arch=('x86_64')
url="https://github.com/SnowyMouse/last-resort"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SnowyMouse/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4899a1c9e9e295a7f1bca304838d2adc3102d60c9b36b6da58704109e71e34ae')

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
