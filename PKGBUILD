# Maintainer: Antoni Przybylik <antoni.przybylik@wp.pl>

_pkgname=pytransform3d
pkgname=python-${_pkgname}
pkgver=3.5.0
pkgrel=0
pkgdesc='3D transformations for Python'
arch=(any)
url="https://pypi.org/project/${_pkgname}/"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-setuptools)
optdepends=('python-pyqt5: Transformation Editor')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/dfki-ric/pytransform3d/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('3124636f988e877fef5a9689ad0e9a21280529a38da6d7a01e28ce9049aacca122185352e0981bdb2987c6e18058cd87b38492a77e50985d9265d456c826834c')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
