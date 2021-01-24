# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=last-resort
pkgver=0.2.2
pkgrel=1
pkgdesc="Tool for convincing Gearbox tags to work with the Xbox version of Halo."
depends=('invader')
makedepends=('cmake' 'ninja')
arch=('x86_64')
url="https://github.com/SnowyMouse/last-resort"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SnowyMouse/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('53387f1a585d7ce631503c78f6a8d8b7906b1d2443edaff99457eddd69d107b7')

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
