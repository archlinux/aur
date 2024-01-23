# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=srsly
pkgname=python-${_pkgname}
pkgver=2.4.8
pkgrel=1
pkgdesc='Modern high-performance serialization utilities for Python'
arch=(x86_64 aarch64)
url='https://pypi.org/project/srsly/'
license=(MIT)
depends=(
	cython
	python-catalogue
	python-pytest
	python-pytest-timeout
	python-pytz
	python-mock
	python-numpy
)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('9f3cb9f06169c2a8513d1f2e4fe1ef53b108b63fe69d526c3a41217c0617a8563d6ab580cc03806472730e4b3ce028829d02125181fec9a82cb171eb5c0936cc')

build() {
	cd "srsly-${pkgver}"
	python setup.py build
}

package() {
	cd "srsly-${pkgver}"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
