# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ignis
pkgname=python-${_pkgname}
pkgver=0.5.0
pkgrel=1
pkgdesc="Tools for quantum hardware verification, noise characterization, and error correction"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-ignis"
license=('Apache')
depends=('python-qiskit-terra')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c27c37696f5a238ef0e41a7b095a6e2a0a6bf7e262831dc0bd1550e576cd8e16')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	# Remove files
	rm -r "${pkgdir}/usr/lib/python3.8/site-packages/docs"
}
