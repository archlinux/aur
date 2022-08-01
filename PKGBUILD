# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=python-ssdpy
pkgver=0.4.1
pkgrel=1
pkgdesc="Lightweight, compatible SSDP library for Python"
arch=('any')
url="https://github.com/MoshiBin/ssdpy"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-mock' 'python-pytest-mock' 'twine')
source=("https://github.com/MoshiBin/ssdpy/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('752fdd4aa0b7b7cb53ac23adcf36f3f85dbf1e9fc70ee90643fd91c8443961eb')

build() {
	cd ssdpy-$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd ssdpy-$pkgver
	pytest
}

package() {
	cd ssdpy-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
