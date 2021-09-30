# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Maintainer: Georg S. Voelker <voelker@maibox.org>
# Based on python-fiat-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=fiat
pkgname=python-${_base}
pkgdesc="Supports generation of arbitrary order instances of the Lagrange elements on lines, triangles, and tetrahedra (stable)."
pkgver=2019.1.0
pkgrel=1
arch=('any')
url="https://bitbucket.org/fenics-project/${_base}"
license=('LGPL3')
groups=('fenics')
conflicts=('python-fiat-git')
depends=('python-numpy' 'python-sympy')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/fenics-project/${_base}/downloads/${_base}-${pkgver}.tar.gz)
sha256sums=('341a1046cbe0f5f2eb26630c2f71f378b0dca51daf9892a54a2ff193970371e9')

build() {
	cd ${srcdir}/${_base}-${pkgver}
 	python setup.py build
}

package() {
	cd ${srcdir}/${_base}-${pkgver}
 	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
