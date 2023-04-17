# Maintainer: Luis Pérez <luis dot perez at protonmail dot com>
pkgname=typioca
pkgver=2.2.0
pkgrel=1
pkgdesc="Tapioca (/ˌtæpiˈoʊkə/) is a starch extracted from the storage roots of the cassava plant. Pearl tapioca is a common ingredient in Asian desserts...and sweet drinks such as bubble tea."
arch=(any)
url="https://github.com/bloznelis/typioca"
license=('MIT')
makedepends=('go' 'make')
provides=(typioca)
conflicts=()
source=("https://github.com/bloznelis/typioca/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f491e785dd6650a354601f727a9670955a3db9ab5f2be62159c3bf388af421a1')

build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "${srcdir}/$pkgname-$pkgver/execs/typioca" "${pkgdir}/usr/bin/typioca"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
