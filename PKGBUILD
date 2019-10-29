# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_gitname=pynbody
_gitbranch=master
pkgbase=python-pynbody-git
pkgname=('python-pynbody-git'
	 'python2-pynbody-git')	 
pkgdesc='Pynbody is a light-weight, portable, format-transparent analysis framework for N-body and hydrodynamic astrophysical simulations'
pkgver=2508.d2a716f0
pkgrel=1
url="http://pynbody.github.io/"
license=('MIT')
arch=('any')
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

package_python-pynbody-git() {
  depends=('python>=3.3'
           'python-numpy'
           'python-scipy')	 
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-pynbody-git() {
  depends=('python2>=2.6'
           'python2-numpy'
           'python2-scipy')	 
  PYTHONPATH="/usr/lib/python2.7/site-packages"
  cd "${srcdir}/${_gitname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
