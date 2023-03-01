# Maintainer: Siôn le Roux <sion@leroux.hu>
pkgname=hexsticker
pkgver=1.2.0
pkgrel=1
pkgdesc="Create hexagon stickers automatically"
arch=('any')
url="https://github.com/fridex/hexsticker"
license=('GPL2')
depends=(
	'python-pillow'
	'python-click'
)
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fridex/hexsticker/archive/${pkgver}.tar.gz")
sha256sums=('8d91581b9620b2e6954fa7ec41fe879206706031e105cad2322cddae4f474ba0')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
