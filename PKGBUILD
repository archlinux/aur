# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=python-pypartpicker
pkgver=1.9.1
pkgrel=1
pkgdesc="Fetch information from PCPartPicker on products and parts lists"
arch=('any')
url="https://github.com/thefakequake/pypartpicker"
license=('MIT')
depends=('python' 'python-bs4' 'python-requests')
makedepends=('python-setuptools')
source=("https://github.com/thefakequake/pypartpicker/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bf1a80da1b411b9b9d4eecfd27071c2d431c4eecffbc37b7ee54f8d0afe4b1e7')

build() {
	cd pypartpicker-$pkgver
	python setup.py build
}

package() {
	cd pypartpicker-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
