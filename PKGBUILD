# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=srsly
pkgname=python-${_pkgname}
pkgver=2.4.1
pkgrel=1
pkgdesc="Modern high-performance serialization utilities for Python"
arch=(i686 x86_64 armv7 aarch64)
url="https://pypi.org/project/srsly/"
license=(MIT)
depends=(
	cython
	python-pytest
	python-pytest-timeout
	python-pytz
	python-mock
	python-numpy
)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b0f2aec0a329e6e7e742a0a60e99a74968ca29be71f35c5c4de221e328176926')

build() {
	cd "srsly-${pkgver}"
	python setup.py build
}

package() {
	cd "srsly-${pkgver}"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
