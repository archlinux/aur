# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_gitname=pynbody
_gitbranch=master
pkgname="python-${_gitname}-git"
pkgdesc='Pynbody is a light-weight, portable, format-transparent analysis framework for N-body and hydrodynamic astrophysical simulations.'
pkgver=1943.4938c7a
pkgrel=1
url="http://pynbody.github.io/"
license=('MIT')
arch=('any')
depends=('python>=3.3'
	 'python-numpy'
	 'python-scipy')	
makedepends=('git'
	 'cython>=0.2')
optdepends=('python-matplotlib: plotting pynbody built-in plots'
	 'ipython: makes using python much easier')
source=("${_gitname}::git://github.com/pynbody/${_gitname}.git#branch=${_gitbranch}")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo "$(git rev-list --count ${_gitbranch}).$(git rev-parse --short ${_gitbranch})"
}

package() {
  cd "${_gitname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
