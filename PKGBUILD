# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=python-pypartpicker
pkgver=1.9.0
pkgrel=1
pkgdesc="Fetch information from PCPartPicker on products and parts lists"
arch=('any')
url="https://github.com/thefakequake/pypartpicker"
license=('MIT')
depends=('python' 'python-bs4' 'python-requests')
makedepends=('python-setuptools')
source=("https://github.com/thefakequake/pypartpicker/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3df5bef6bafc39ca9a455305cc44282143ed27b701d3ecde0dd204a84245a657')

build() {
	cd pypartpicker-$pkgver
	python setup.py build
}

package() {
	cd pypartpicker-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
