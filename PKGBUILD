# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=pyDes
pkgname=python-pydes
pkgver=2.0.1
pkgrel=1
pkgdesc="Pure python implementation of DES and TRIPLE DES encryption algorithm"
arch=('x86_64')
url="https://pypi.org/project/pyDes/"
license=('MIT')
depends=('python')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
sha256sums=('e2ab8e21d2b83e90d90dbfdcb6fb8ac0000b813238b7ecaede04f8435c389012')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
