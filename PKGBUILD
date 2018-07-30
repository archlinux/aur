# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=transip-api
pkgname=python-${_pkgname}
pkgver=0.4.0
pkgrel=1
pkgdesc="Python implementation of TransIP's API (unofficial)"
arch=('any')
url="https://github.com/benkonrath/transip-api"
license=('MIT')
makedepends=('git' 'python-setuptools')
depends=('python-rsa' 'python-requests' 'python-suds-jurko')
source=("https://github.com/benkonrath/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('b1d50e62f61fdeadd94cdbf4288b6ebb')

build() {
	cd "${_pkgname}-${pkgver}"
	python3 setup.py build
}

check() {
	cd "${_pkgname}-${pkgver}"
	python3 setup.py test
}

package() {
	cd "${_pkgname}-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
