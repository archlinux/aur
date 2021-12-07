# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=wasabi
pkgname=python-${_pkgname}
pkgver=0.9.0
pkgrel=1
pkgdesc='Lightweight console printing and formatting toolkit'
url='https://pypi.org/project/wasabi/'
depends=(python)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('152245d892030a3a7b511038e9472acff6d0e237cfe4123fef0d147f2d3274fc')

build() {
	cd "wasabi-${pkgver}"
	python setup.py build
}

package() {
	cd "wasabi-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-wasabi/LICENSE"
}
