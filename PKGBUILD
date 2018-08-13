# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Based on python-fiat-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=fiat
pkgname=python-${_base}
pkgdesc="Supports generation of arbitrary order instances of the Lagrange elements on lines, triangles, and tetrahedra (stable)."
pkgver=2018.1.0
pkgrel=2
arch=('any')
url="https://bitbucket.org/fenics-project/${_base}"
license=('LGPL3')
groups=('fenics')
conflicts=('python-fiat-git')
depends=('python-numpy' 'python-sympy<1.2')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/fenics-project/${_base}/downloads/${_base}-${pkgver}.tar.gz)
sha256sums=('3d897d99fdc94441f9c8720fb5a3bcaf8a0b9ede897a0600cb1f329dacec5c92')

build() {
	cd ${srcdir}/${_base}-${pkgver}
 	python setup.py build
}

package() {
	cd ${srcdir}/${_base}-${pkgver}
 	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
