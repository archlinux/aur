# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Based on python-instant-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=instant
pkgname=python-${_base}
install=${pkgname}.install
pkgdesc="A Python module allowing for instant inlining of C and C++ code in Python (stable)."
pkgver=2017.2.0
pkgrel=1
arch=('any')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics')
conflicts=('python-instant-git')
depends=('python-numpy' 'python-six' 'swig')
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
