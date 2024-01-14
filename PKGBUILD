# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>

_pkgname=lcu-driver
pkgname=python-${_pkgname}
pkgver=3.0.1
pkgrel=1
pkgdesc='A library made to communicate with League of Legends Client API in a easy way'
arch=(any)
url="https://pypi.org/project/${_pkgname}/"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/sousa-andre/lcu-driver/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('05437b55d898b91034dea5bbe8ad1de87836f71b286fafe6f8a149b5fd1424c0')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}