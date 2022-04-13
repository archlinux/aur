# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=srsly
pkgname=python-${_pkgname}
pkgver=2.4.3
pkgrel=1
pkgdesc='Modern high-performance serialization utilities for Python'
arch=(x86_64 aarch64)
url='https://pypi.org/project/srsly/'
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
b2sums=('57788adcf436099dbf9557a15c1bd3bf8195cafd5b38e31343f711551d4a825b9c440ffdb6b194f2dd9929167b0c65fae305b2cc2a3446a24cbc843cd6ca49ff')

build() {
	cd "srsly-${pkgver}"
	python setup.py build
}

package() {
	cd "srsly-${pkgver}"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
