# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

_commit='11f0d7b61da39befffc2e4fedb191563923b94ce'
pkgbase=python-treelib
pkgname=('python-treelib' 'python2-treelib')
pkgver=1.5.1
pkgrel=1
pkgdesc='An efficient implementation of tree data structure in python'
arch=('any')
url='https://github.com/caesar0301/treelib'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/caesar0301/treelib/archive/${_commit}.tar.gz")
sha256sums=('1ac42cf481657b8e2d22a42952b5c4671d1c3223add37194380976bc8d62ed76')

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
