# Maintainer: Iru Cai <mytbk920423@gmail.com>

pkgbase=('python-matrix-client-git')
pkgname=('python-matrix-client-git' 'python2-matrix-client-git')
pkgdesc='Matrix Client-Server SDK for Python 2 and 3'
pkgver=0.0.5.179
pkgrel=1
arch=('any')
url='https://github.com/matrix-org/matrix-python-sdk'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=('git+https://github.com/matrix-org/matrix-python-sdk.git')
sha256sums=('SKIP')

package_python-matrix-client-git() {
depends=('python-requests')

	cd "${srcdir}/matrix-python-sdk"
	python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-matrix-client-git() {
depends=('python2-requests')

	cd "${srcdir}/matrix-python-sdk"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

pkgver() {
	cd "${srcdir}/matrix-python-sdk"
	git describe --always | cut -d- -f1-2 | sed -e 's/-/./' -e 's/^[^0-9]*//'
}
