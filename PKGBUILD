# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-swiglpk
pkgver=4.65.1
pkgrel=3
pkgdesc='A low-level Python interface to the GLPK optimization solver.'
arch=('any')
url='https://github.com/biosustain/swiglpk'
license=('GPL3')
depends=('python' 'glpk')
makedepends=('swig' 'python-setuptools')

source=("https://github.com/biosustain/swiglpk/archive/${pkgver}.tar.gz")

prepare() {
	cd "${srcdir}/swiglpk-${pkgver}"

	# Work around https://github.com/biosustain/swiglpk/issues/40.
	cp /usr/include/glpk.h .
}

package() {
	cd "${srcdir}/swiglpk-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

md5sums=('8d364cad69416cebd6e405b22f71c14d')
