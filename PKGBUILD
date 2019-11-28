# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ignis
pkgname=python-${_pkgname}
pkgver=0.2.0
pkgrel=1
pkgdesc="Tools for quantum hardware verification, noise characterization, and error correction"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-ignis"
license=('Apache')
depends=('python-qiskit-terra')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('00ed81244dbe6570a981e97ca4d9e3374576b34de2e2f35973da411d26d136ec')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
