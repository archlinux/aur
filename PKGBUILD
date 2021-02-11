# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=last-resort
pkgver=0.3.1
pkgrel=1
pkgdesc="Tool for convincing Gearbox tags to work with the Xbox version of Halo."
depends=('invader')
makedepends=('cmake' 'ninja')
arch=('x86_64')
url="https://github.com/SnowyMouse/last-resort"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SnowyMouse/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b29a985ae7daef4f85fed99ed0aa04c53f4cca4036e5f2fc7cdfb722fd5e0621')

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
