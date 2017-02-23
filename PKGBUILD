# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

_commit='6db532fb95d8ecc73242c3f4ea3e975fe4c78065'
pkgbase=python-treelib
pkgname=('python-treelib' 'python2-treelib')
pkgver=1.3.5
pkgrel=1
pkgdesc='An efficient implementation of tree data structure in python'
arch=('any')
url='https://github.com/caesar0301/treelib'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/caesar0301/treelib/archive/${_commit}.tar.gz")
sha256sums=('7643bf1653eaf7f34093b9261adea653b49a4dadb6dd63ad36254d21c6a99395')

prepare() {
  cp -r treelib-${_commit} python-treelib-${pkgver}
  cp -r treelib-${_commit} python2-treelib-${pkgver}
}

package_python-treelib() {
  cd python-treelib-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize='1'
}

package_python2-treelib() {
  cd python2-treelib-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize='1'
}
