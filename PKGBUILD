# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgbase=python-pytest-dependency
pkgname=('python-pytest-dependency' 'python2-pytest-dependency')
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc="Manage dependencies of tests."
arch=('any')
url="https://github.com/RKrahl/pytest-dependency"
license=('MIT')
makedepends=('python-setuptools'
             'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('bda0ef48e6a44c091399b12ab4a7e580d2dd8294c222b301f88d7d57f47ba142')

prepare() {
  cp -a pytest-dependency-${pkgver}{,-py2}
}

package_python-pytest-dependency() {
  cd pytest-dependency-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-pytest-dependency() {
  cd pytest-dependency-${pkgver}-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
