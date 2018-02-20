# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Based on python-ffc-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=ffc
pkgname=python-${_base}
pkgdesc="A compiler for finite element variational forms (stable)."
pkgver=2017.2.0
pkgrel=1
arch=('any')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics')
conflicts=('python-ffc-git')
depends=('python-dijitso' 'python-fiat' 'python-ufl') # Will need pybind11 in future
makedepends=('git')
options=(!emptydirs)
source=("${_base}::git+https://bitbucket.org/fenics-project/${_base}.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
	cd ${_base}
	python setup.py build
}

package() {
	cd ${_base}
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
