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
sha512sums=('1a1579dec5a35f37ee93af96de09e7e8753a95bd48e3c581592f0e13aa2fed3bf097e014921b9c67540e8ebfe03ca31c528c9ff4738c2116ff372b790dae7a41')

prepare() {
  cp -a pytest-dependency-${pkgver}{,-py2}
}

package_python-pytest-dependency() {
  depends=('python'
           'python-pytest')
  cd pytest-dependency-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-pytest-dependency() {
  depends=('python2'
           'python2-pytest')
  cd pytest-dependency-${pkgver}-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
