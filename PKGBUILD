# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgbase=python-pytest-dependency
pkgname=('python-pytest-dependency' 'python2-pytest-dependency')
_name=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc="Manage dependencies of tests."
arch=('any')
url="https://github.com/RKrahl/pytest-dependency"
license=('MIT')
makedepends=('python-setuptools'
             'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('efc615d41d0db9f3fbce2578a306d70675756ec9feb8de90c9e730eaa15d1f50779c356cff9e7621946c6f431c68c348abac5319d4dce5bfd4da0ba829eb2f69')

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
