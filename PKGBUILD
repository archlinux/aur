# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-ignis
pkgname=python-${_pkgname}
pkgver=0.7.0
pkgrel=1
pkgdesc="Tools for quantum hardware verification, noise characterization, and error correction (DEPRECATED)"
arch=('x86_64')
url="https://github.com/Qiskit/qiskit-ignis"
license=('Apache')
depends=('python-qiskit-terra')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Qiskit/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9a4938fbc8d0f1c26f49048cd27d92de320dc32c63fd903a03ceac7865f4ef82')
install="${pkgname}.install"

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    # Remove files
    rm -r "${pkgdir}/usr/lib/python3.10/site-packages/docs"
}
