# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Maintainer: Georg S. Voelker <voelker@maibox.org>
# Based on python-ffc-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=ffc
pkgname=python-${_base}
pkgdesc="A compiler for finite element variational forms (stable)."
pkgver=2019.1.0
pkgrel=2
arch=('any')
url="https://bitbucket.org/fenics-project/${_base}"
license=('LGPL3')
groups=('fenics')
conflicts=('python-ffc-git')
depends=('python-dijitso=2019.1.0'
         'python-fiat=2019.1.0'
				 'python-ufl=2019.1.0'
				 'pybind11'
				 'python-setuptools')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/fenics-project/${_base}/downloads/${_base}-${pkgver}.tar.gz)
sha256sums=('4ff821a234869d8b9aaf8c5d7f617d42f9c134a2529e76c9519b681dff35affd')

build() {
	cd ${srcdir}/${_base}-${pkgver}
	python setup.py build
}

package() {
	cd ${srcdir}/${_base}-${pkgver}
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
