# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

_pkgname=py3nvml
pkgname=python-${_pkgname}
pkgver=0.2.2
pkgrel=1
pkgdesc="Bindings for NVML library."
arch=('any')
url="https://github.com/fbcotter/py3nvml"
license=('BSD')
depends=('nvidia')
makedepends=('python-setuptools')
provides=()
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('647c0131368d0bdb1d1796d3e10651240bae2c0cc89d193d19a6dccc1a81781d')

build() {
	cd "${_pkgname}-$pkgver"
	python setup.py build
}

package() {
	cd "${_pkgname}-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
