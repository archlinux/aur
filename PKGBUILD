# Maintainer: Luis Pérez <luis dot perez at protonmail dot com>
pkgname=typioca
pkgver=1.2.3
pkgrel=1
pkgdesc="Tapioca (/ˌtæpiˈoʊkə/) is a starch extracted from the storage roots of the cassava plant. Pearl tapioca is a common ingredient in Asian desserts...and sweet drinks such as bubble tea."
arch=(any)
url="https://github.com/bloznelis/typioca"
license=('MIT')
makedepends=('go' 'make')
provides=(typioca)
conflicts=()
source=("https://github.com/bloznelis/typioca/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3f4b5180a4e4ad05aa063f88a2a047562d3c04452f1db9cb4f6557198ac8a43a')

build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "${srcdir}/$pkgname-$pkgver/execs/typioca" "${pkgdir}/usr/bin/typioca"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
