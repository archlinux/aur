# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_gitname=pynbody
_gitbranch=master
pkgbase=python-pynbody-git
pkgname=('python-pynbody-git')	 
pkgdesc="Light-weight,portable,format-transparent analysis framework for N-body and hydrodynamic astrophysical simulations"
pkgver=1.1.0.1bbec4d
pkgrel=1
url="http://pynbody.github.io/"
license=('MIT')
arch=('any')
makedepends=('git'
    'cython>=0.2')
optdepends=('python-matplotlib: plotting pynbody built-in plots'
    'ipython: makes using python much easier')
source=("https://github.com/pynbody/pynbody/archive/refs/heads/master.zip")
sha256sums=('cc9fe3bcb8902b707a30af91cc06ef9d18667959685c0b8235276a7ae86f81aa')

pkgver() {
  cd "${_gitname}-${_gitbranch}"
  echo "1.1.0.$(git rev-parse --short ${_gitbranch})"
}

package_python-pynbody-git() {
  depends=('python>=3.3'
      'python-numpy'
      'python-scipy')	 
    cd "${srcdir}/${_gitname}-${_gitbranch}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et
