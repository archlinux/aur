# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=ndeflib
pkgname=python-${_pkgname}
pkgver=0.3.3
pkgrel=1
pkgdesc="Python package for parsing and generating NFC Data Exchange Format messages"
arch=('x86_64')
url="https://github.com/nfcpy/ndeflib"
license=('custom:ISC')
depends=('python')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/nfcpy/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ba347891000a538616e41b7ff37ee8dc92ce6a742816c3e93a1f52e90b1606e7')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
