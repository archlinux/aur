# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

_base=dijitso
_fragment="#branch=master"
pkgname=python-${_base}-git
pkgdesc="A Python module for distributed just-in-time shared library building"
pkgver=20161101
pkgrel=1
arch=('any')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics-git')
depends=('python-six')
makedepends=('git')
options=(!emptydirs)
source=("${_base}::git+https://bitbucket.org/fenics-project/${_base}.git${_fragment}")
md5sums=('SKIP')

pkgver() {
	cd ${_base}
	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
	cd ${_base}
	python setup.py build
}

package() {
	cd ${_base}
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
