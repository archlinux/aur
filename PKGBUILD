# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ignis
pkgname=python-${_pkgname}
pkgver=0.3.0
pkgrel=1
pkgdesc="Tools for quantum hardware verification, noise characterization, and error correction"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-ignis"
license=('Apache')
depends=('python-qiskit-terra')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('03fffd88ccc640144bbec332dc781ccb3e944e6745c17c5d069d06ecf7b5cef4')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
