# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ignis
pkgname=python-${_pkgname}
pkgver=0.6.0
pkgrel=1
pkgdesc="Tools for quantum hardware verification, noise characterization, and error correction"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-ignis"
license=('Apache')
depends=('python-qiskit-terra')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('25de6af529879e4a5a0c1a5196faa911087dbd055a8ec788183a7141034091b3')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    # Remove files
    rm -r "${pkgdir}/usr/lib/python3.9/site-packages/docs"
}
