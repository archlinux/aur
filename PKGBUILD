# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=dlx
pkgname=python-dlx
pkgver=1.0.4
pkgrel=3
pkgdesc="Implementation of Donald Knuth's Dancing Links algorithm"
arch=('x86_64')
url="https://pypi.org/project/dlx/"
license=('Apache')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ef75bc9d590216ebde7d4811f9ae6b2d6c6dc2a54772d94ae13384dc517a5aae')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
