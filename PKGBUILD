# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=srsly
pkgname=python-${_pkgname}
pkgver=2.4.4
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
b2sums=('7e2ea79b2375b059c31dd89ccfb994d2dcd1ae025d836cc52b058ffac90be1405baedf916c7c3ee66387e8095d6bfe21f8ea38198f767aa3208830c9386fe7e0')

build() {
	cd "srsly-${pkgver}"
	python setup.py build
}

package() {
	cd "srsly-${pkgver}"
	python setup.py install --skip-build --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
