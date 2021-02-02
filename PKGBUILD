# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=last-resort
pkgver=0.3.0
pkgrel=1
pkgdesc="Tool for convincing Gearbox tags to work with the Xbox version of Halo."
depends=('invader')
makedepends=('cmake' 'ninja')
arch=('x86_64')
url="https://github.com/SnowyMouse/last-resort"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SnowyMouse/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d50918b59cb47c42d6b0e68efac49623ebcf8cbfe8909dca693e25c3505e9f3b')

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
